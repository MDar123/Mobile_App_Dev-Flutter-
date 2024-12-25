import 'package:flutter/material.dart';

class SkillsContent extends StatelessWidget {
  const SkillsContent({super.key});

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
              'Skills:',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            buildSkillBar('Angular', 90),
            buildSkillBar('React', 90),
            buildSkillBar('Dart', 85),
            buildSkillBar('Flutter', 80),
            buildSkillBar('UI/UX Design', 75),
            buildSkillBar('Django', 70),
            buildSkillBar('MYSQL', 65),
            buildSkillBar('Git and Github', 70),
          ],
        ),
      ),
    );
  }

  Widget buildSkillBar(String skill, int percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text('$percentage%'),
        const SizedBox(height: 20),
      ],
    );
  }
}
