import 'package:flutter/material.dart';

class EducationContent extends StatelessWidget {
  const EducationContent({super.key});

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
              'Education',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            buildEducationCard(
              'Graduation',
              'The University Of Lahore',
              'Bachelor of Science in Information Engineering Technology, BSIET (2022-Present).',
            ),
            buildEducationCard(
              'Intermediate',
              'Crescent College',
              'ICS. (2020-2022)',
            ),
            buildEducationCard(
              'Matriculation',
              'The Smart School',
              '(2018-2020)',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEducationCard(String title, String institution, String details) {
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
            Text(institution, style: const TextStyle(fontSize: 18)),
            Text(details),
          ],
        ),
      ),
    );
  }
}
