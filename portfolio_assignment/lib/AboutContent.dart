// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    'images/profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Name and Title
              const Text(
                'Mujtaba Sohail Dar',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Full Stack Developer | Flutter | UI/UX Designer | Angular Developer | React Developer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // Social Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildSocialIcon(Icons.facebook, 'Facebook', Colors.blue),
                  buildSocialIcon(Icons.camera_alt, 'Instagram', Colors.purple),
                  buildSocialIcon(
                      Icons.linked_camera, 'LinkedIn', Colors.blueAccent),
                  buildSocialIcon(Icons.telegram, 'Telegram', Colors.lightBlue),
                ],
              ),

              const SizedBox(height: 30),

              // Description
              const Text(
                '👋 Hi! I’m a full-stack developer who loves learning and building amazing web applications. I focus on front-end technologies like ReactJS and Angular and also work on back-end development to create complete, user-friendly solutions.',
                style:
                    TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 30),

              // Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'CHECK RESUME',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSocialIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, size: 30, color: color),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }
}
