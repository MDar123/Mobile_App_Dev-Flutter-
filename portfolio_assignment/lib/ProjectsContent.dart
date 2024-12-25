import 'package:flutter/material.dart';

class ProjectsContent extends StatelessWidget {
  const ProjectsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Projects and Experience',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            buildProjectCard(
              'Currency Converter App',
              'A simple currency converter app built with Flutter.',
            ),
            buildProjectCard(
              'Weather App',
              'A weather app built with Flutter that fetches data from a REST API.',
            ),
            buildProjectCard(
              'Portfolio Project',
              'Made a portfolio website using Flutter.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Experience',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildProjectCard(
              'Intern as an Angular Developer',
              'Premier Solutions\n\nSuccessfully completed internship at Premier Solutions Software House.',
            ),
            buildProjectCard(
              'Self Employed',
              'Code and Build something in everyday',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProjectCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}
