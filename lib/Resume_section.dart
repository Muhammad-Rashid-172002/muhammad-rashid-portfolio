import 'package:flutter/material.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Trigger animation after a small delay
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Helper to animate a widget with fade + slide
  Widget _animate(Widget child, {Offset beginOffset = const Offset(0, 0.2)}) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: Tween<Offset>(begin: beginOffset, end: Offset.zero)
            .animate(_fadeAnimation),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A), // Same as AboutMePage background
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _animate(_resumeContent(), beginOffset: const Offset(0, 0.1)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resumeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        _animate(
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
                child: Divider(
                  color: Color(0xFF3B82F6), // Matches AboutMePage
                  thickness: 2,
                ),
              ),
            ],
          ),
          beginOffset: const Offset(0, 0.1),
        ),
        const SizedBox(height: 32),

        // EDUCATION & EXPERIENCE
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
                    _animate(_sectionTitle('Education', Icons.school)),
                    const SizedBox(height: 12),
                    _animate(_resumeCard(
                      '2023 - 2024',
                      'Flutter Development',
                      'SMIT',
                      Icons.school,
                    )),
                    _animate(_resumeCard(
                      '2022 - 2025',
                      'Software Engineering',
                      'Sarhad University',
                      Icons.school,
                    )),
                  ],
                ),
              ),

              if (isWide)
                const SizedBox(width: 30)
              else
                const SizedBox(height: 24),

              // EXPERIENCE
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _animate(_sectionTitle('Experience', Icons.work)),
                    const SizedBox(height: 12),
                    _animate(_resumeCard(
                      '2025 - Present',
                      'Flutter Developer',
                      'MR Technologies',
                      Icons.work,
                    )),
                    _animate(_resumeCard(
                      '2024 - 2025',
                      'Flutter Developer Intern',
                      'Xohub Solution',
                      Icons.work,
                    )),
                  ],
                ),
              ),
            ],
          );
        }),

        const SizedBox(height: 40),

        // WORK SKILLS
        _animate(_sectionTitle('Work Skills')),
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

        // SOFT SKILLS
        _animate(_sectionTitle('Soft Skills')),
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
            Icon(icon, color: const Color(0xFF3B82F6), size: 22),
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
        color: const Color(0xFF111827), // Matches AboutMePage card color
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1F2937)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF3B82F6), size: 28),
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

// ================= SKILL CHIP =================
class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937), // Matches AboutMePage
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
