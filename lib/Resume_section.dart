import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            const Text(
              'Resume',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 32),

            // EDUCATION & EXPERIENCE
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // EDUCATION
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _TitleWithIcon(
                        icon: Icons.school,
                        title: 'Education',
                      ),
                      SizedBox(height: 20),
                      _LightCard(
                        year: '2022 – Present',
                        title: 'BS Software Engineering',
                        subtitle: 'University / Institute',
                      ),
                      _LightCard(
                        year: '2019 – 2021',
                        title: 'Intermediate (Computer Science)',
                        subtitle: 'College',
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 32),

                // EXPERIENCE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _TitleWithIcon(
                        icon: Icons.work_outline,
                        title: 'Experience',
                      ),
                      SizedBox(height: 20),
                      _LightCard(
                        year: '2024 – Present',
                        title: 'Flutter Developer',
                        subtitle: 'Freelance / Client Projects',
                      ),
                      _LightCard(
                        year: '2023 – 2024',
                        title: 'Flutter Intern',
                        subtitle: 'CodeAlpha',
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 48),

            // SKILLS
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // WORK SKILLS
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Work Skills',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _SkillChip('Flutter'),
                          _SkillChip('Dart'),
                          _SkillChip('Firebase'),
                          _SkillChip('REST APIs'),
                          _SkillChip('Git'),
                          _SkillChip('GitHub'),
                          _SkillChip('SQLite'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 32),

                // SOFT SKILLS
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Soft Skills',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _SkillChip('Time Management'),
                          _SkillChip('Communication'),
                          _SkillChip('Problem Solving'),
                          _SkillChip('Teamwork'),
                          _SkillChip('Adaptability'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- TITLE WITH ICON ----------------
class _TitleWithIcon extends StatelessWidget {
  final IconData icon;
  final String title;

  const _TitleWithIcon({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black87),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ---------------- CARD ----------------
class _LightCard extends StatelessWidget {
  final String year;
  final String title;
  final String subtitle;

  const _LightCard({
    required this.year,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEDD5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            year,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- SKILL CHIP ----------------
class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
