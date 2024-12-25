import 'package:flutter/material.dart';

class InterestsContent extends StatelessWidget {
  const InterestsContent({super.key});

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
              'Portfolio Interest Section',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'My Interests:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            buildInterestItem(
              'Mobile App Development',
              'Creating innovative and user-friendly mobile applications.',
            ),
            buildInterestItem(
              'Web Development',
              'Building responsive and scalable web applications.',
            ),
            buildInterestItem(
              'Machine Learning',
              'Exploring algorithms and models to extract insights from data.',
            ),
            buildInterestItem(
              'UI/UX Design',
              'Designing intuitive and visually appealing user interfaces.',
            ),
            buildInterestItem(
              'Cloud Computing',
              'Leveraging cloud platforms for efficient and scalable solutions.',
            ),
            buildInterestItem(
              'Open Source Contribution',
              'Contributing to open source projects and communities.',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInterestItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(description),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
