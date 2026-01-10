import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  final Color primary = const Color(0xFFFF7A18);
  final Color cardColor = const Color(0xFFFFE4C7);
  final Color chipColor = const Color(0xFFF1F5F9);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: const Color(0xFFF8FAFC),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ===== TITLE =====
          const Text(
            "Resume",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),

          const SizedBox(height: 28),

          // ===== EDUCATION & EXPERIENCE =====
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _section(
                  icon: Icons.school,
                  title: "Education",
                  items: [
                    _resumeCard(
                      "2020 - 2021",
                      "Software Development",
                      "Moringa School",
                    ),
                    _resumeCard(
                      "2012 - 2016",
                      "Disaster Management",
                      "Masinde Muliro University",
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: _section(
                  icon: Icons.work,
                  title: "Experience",
                  items: [
                    _resumeCard(
                      "2022 - Present",
                      "Technical Mentor",
                      "Moringa School",
                    ),
                    _resumeCard(
                      "2021 - 2022",
                      "Website Development",
                      "Village 2 Nation",
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // ===== SKILLS =====
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _skillSection(
                  title: "Work Skills",
                  skills: [
                    "Flutter",
                    "Dart",
                    "Firebase",
                    "REST APIs",
                    "Git",
                    "UI/UX",
                    "JavaScript",
                    "HTML5",
                    "CSS3",
                  ],
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: _skillSection(
                  title: "Soft Skills",
                  skills: [
                    "Time Management",
                    "Mentorship",
                    "Communication",
                    "Flexibility",
                    "Research",
                    "Writing",
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ===== SECTION HEADER =====
  Widget _section({
    required IconData icon,
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: primary, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        ...items,
      ],
    );
  }

  // ===== RESUME CARD =====
  Widget _resumeCard(String year, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            year,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black54,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }

  // ===== SKILL SECTION =====
  Widget _skillSection({
    required String title,
    required List<String> skills,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills.map(
            (skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: chipColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.none,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
