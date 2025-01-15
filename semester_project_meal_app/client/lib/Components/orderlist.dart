import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<dynamic> orders = [];

  @override
  void initState() {
    super.initState();
    getAllOrders();
  }

  Future<void> getAllOrders() async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost:8000/AdminDashboard/GetAllOrders/'));
      if (response.statusCode == 200) {
        setState(() {
          orders = jsonDecode(response.body);
        });
      }
    } catch (e) {
      debugPrint('Error fetching orders: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Order Dashboard'),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text(
                'No Orders Placed',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Order ID')),
                    DataColumn(label: Text('Customer')),
                    DataColumn(label: Text('Products')),
                    DataColumn(label: Text('Total Price')),
                    DataColumn(label: Text('Order Date')),
                  ],
                  rows: orders.map((order) {
                    return DataRow(
                      cells: [
                        DataCell(Text('#${order['id']}')),
                        DataCell(Text(order['username'])),
                        DataCell(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                (order['products'] as List).map((product) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      product['description'],
                                      style: const TextStyle(
                                          color: Colors.black54),
                                    ),
                                    Text(
                                      'Rs. ${product['price']}',
                                      style: const TextStyle(
                                          color: Colors.black87),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        DataCell(Text('Rs. ${order['total_price']}')),
                        DataCell(
                          Text(
                            DateTime.parse(order['created_at'])
                                .toLocal()
                                .toString()
                                .split(' ')[0],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }
}
