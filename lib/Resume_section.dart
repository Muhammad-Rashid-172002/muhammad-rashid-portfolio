import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _topBar(),
              const SizedBox(height: 30),

              // RESUME CONTENT
              _resumeContent(),
            ],
          ),
        ),
      ),
    );
  }

  // // ================= TOP BAR =================
  // Widget _topBar() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       const Text(
  //         'Muhammad Rashid',
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 22,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       Container(
  //         padding: const EdgeInsets.all(6),
  //         decoration: BoxDecoration(
  //           color: const Color(0xFF111827),
  //           borderRadius: BorderRadius.circular(40),
  //         ),
  //         child: Row(
  //           children: const [
  //             _NavItem(icon: Icons.home, label: 'Home'),
  //             _NavItem(icon: Icons.description, label: 'Resume', active: true),
  //             _NavItem(icon: Icons.work, label: 'Work'),
  //             _NavItem(icon: Icons.mail, label: 'Contact'),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // // ================= RESUME CONTENT =================
  Widget _resumeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        Row(
          children: const [
            Text(
              'RESUME',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Divider(color: Color(0xFF3B82F6), thickness: 2),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // ===== EDUCATION & EXPERIENCE (SIDE BY SIDE) =====
        LayoutBuilder(builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
          return Flex(
            direction: isWide ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // EDUCATION
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('Education', Icons.school),
                    _resumeCard(
                      '2023 - 2024',
                      'Flutter Development',
                      'SMIT',
                      Icons.school,
                    ),
                    _resumeCard(
                      '2022 - 2025',
                      'Software Engineering',
                      'Sarhad University',
                      Icons.school,
                    ),
                  ],
                ),
              ),

              if (isWide) const SizedBox(width: 30) else const SizedBox(height: 24),

              // EXPERIENCE
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('Experience', Icons.work),
                    _resumeCard(
                      '2025 - Present',
                      'Flutter Developer',
                      'MR Technologies',
                      Icons.work,
                    ),
                    _resumeCard(
                      '2024 - 2025',
                      'Flutter Developer Intern',
                      'Xohub Solution',
                      Icons.work,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),

        const SizedBox(height: 40),

        // ===== WORK SKILLS =====
        _sectionTitle('Work Skills'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _SkillChip('Flutter'),
            _SkillChip('Dart'),
            _SkillChip('Firebase'),
            _SkillChip('REST APIs'),
            _SkillChip('Git'),
            _SkillChip('UI/UX Design'),
            _SkillChip('Provider / Riverpod'),
            _SkillChip('Animations & Widgets'),
            _SkillChip('Flutter Web & Desktop'),
            _SkillChip('SQLite / Hive / SharedPreferences'),
          ],
        ),

        const SizedBox(height: 32),

        // ===== SOFT SKILLS =====
        _sectionTitle('Soft Skills'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _SkillChip('Communication'),
            _SkillChip('Time Management'),
            _SkillChip('Problem Solving'),
            _SkillChip('Team Work'),
            _SkillChip('Adaptability'),
            _SkillChip('Mentorship'),
            _SkillChip('Critical Thinking'),
            _SkillChip('Creativity'),
          ],
        ),

        const SizedBox(height: 40),
      ],
    );
  }

  // ================= HELPERS =================
  Widget _sectionTitle(String title, [IconData? icon]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.blueAccent, size: 22),
            const SizedBox(width: 8),
          ],
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _resumeCard(
    String year,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1F2937)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(year, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 6),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= NAV ITEM =================
class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _NavItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF3B82F6) : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: active ? Colors.white : Colors.grey),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(color: active ? Colors.white : Colors.grey),
          ),
        ],
      ),
    );
  }
}

// ================= SKILL CHIP =================
class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
