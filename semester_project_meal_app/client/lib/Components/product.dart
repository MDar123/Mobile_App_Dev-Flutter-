import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  List<dynamic> products = [];
  bool isModalOpen = false;
  Map<String, dynamic>? editingProduct;

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  File? imageFile;

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8000/AdminDashboard/GetAllProducts/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
        });
      }
    } catch (error) {
      debugPrint('Error fetching products: $error');
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  Future<void> handleAddProduct() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://localhost:8000/AdminDashboard/GetAllProducts/'),
      );

      request.fields['name'] = nameController.text;
      request.fields['description'] = descriptionController.text;
      request.fields['price'] = priceController.text;

      if (imageFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath('image', imageFile!.path),
        );
      }

      await request.send();

      setState(() {
        isModalOpen = false;
        imageFile = null;
      });

      nameController.clear();
      descriptionController.clear();
      priceController.clear();

      getAllProducts();
    } catch (error) {
      debugPrint('Error adding product: $error');
    }
  }

  Future<void> handleDeleteProduct(int id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await http.delete(
          Uri.parse('http://localhost:8000/AdminDashboard/GetProductById/$id/'),
        );
        getAllProducts();
      } catch (error) {
        debugPrint('Error deleting product: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Product Dashboard'),
      ),
      body: products.isEmpty
          ? const Center(
              child: Text(
                'You have not added any product',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: Image.network(
                      product['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product['name']),
                    subtitle: Text(product['description']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Rs. ${product['price']}'),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              editingProduct = product;
                              nameController.text = product['name'];
                              descriptionController.text =
                                  product['description'];
                              priceController.text =
                                  product['price'].toString();
                              isModalOpen = true;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => handleDeleteProduct(product['id']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            editingProduct = null;
            nameController.clear();
            descriptionController.clear();
            priceController.clear();
            imageFile = null;
            isModalOpen = true;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
