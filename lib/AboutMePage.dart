import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(22),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER (NO LINE)
            const Text(
              'RESUME',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // EDUCATION & EXPERIENCE
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // EDUCATION
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _SectionTitle(
                        icon: Icons.school,
                        title: 'Education',
                      ),
                      SizedBox(height: 20),
                      _ResumeCard(
                        year: '2022 – Present',
                        title: 'BS Software Engineering',
                        subtitle: 'University / Institute',
                      ),
                      _ResumeCard(
                        year: '2019 – 2021',
                        title: 'Intermediate (Computer Science)',
                        subtitle: 'College',
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 30),

                // EXPERIENCE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      _SectionTitle(
                        icon: Icons.work,
                        title: 'Experience',
                      ),
                      SizedBox(height: 20),
                      _ResumeCard(
                        year: '2024 – Present',
                        title: 'Flutter Developer',
                        subtitle: 'Freelance / Projects',
                      ),
                      _ResumeCard(
                        year: '2023 – 2024',
                        title: 'Flutter Intern',
                        subtitle: 'CodeAlpha',
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

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
                          color: Colors.white,
                          fontSize: 22,
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

                const SizedBox(width: 30),

                // SOFT SKILLS
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Soft Skills',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
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

// ---------------- SECTION TITLE ----------------
class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionTitle({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF3B82F6), size: 22),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ---------------- RESUME CARD ----------------
class _ResumeCard extends StatelessWidget {
  final String year;
  final String title;
  final String subtitle;

  const _ResumeCard({
    required this.year,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF1F2937)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            year,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
