import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MAIN CONTENT
              isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _profileCard(),
                        const SizedBox(width: 40),
                        Expanded(child: _rightContent()),
                      ],
                    )
                  : Column(
                      children: [
                        _profileCard(),
                        const SizedBox(height: 30),
                        _rightContent(),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }

  Widget _profileCard() {
    return SizedBox(
      width: 300,
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('assets/Rashid_Profile_Pic_01.png'),
            ),
            const SizedBox(height: 18),
            const Text(
              'Muhammad Rashid',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Flutter Developer',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _infoTile(Icons.phone, '+92 319 5176014'),
            _infoTile(Icons.email, 'muhammadrashid172002@gmail.com'),
            _infoTile(Icons.location_on, 'Pakistan'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Download Resume'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rightContent() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ABOUT HEADER
          Row(
            children: const [
              Text(
                'ABOUT ME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 16),
              Expanded(child: Divider(color: Color(0xFF3B82F6), thickness: 2)),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'I am Muhammad Rashid, a Flutter Developer and Software Engineering student. '
            'I specialize in building modern, scalable, and user-friendly mobile applications '
            'using Flutter, Dart, and Firebase.',
            style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 32),
          const Text(
            'What I Do',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: const [
              _ServiceCard(
                icon: Icons.language,
                title: 'Web Development',
                description:
                    'Building fast, scalable, and modern web applications.',
              ),
              _ServiceCard(
                icon: Icons.phone_android,
                title: 'App Development',
                description:
                    'High-performance cross-platform apps using Flutter.',
              ),
              _ServiceCard(
                icon: Icons.design_services,
                title: 'UI/UX Designing',
                description:
                    'Clean and intuitive user-centered design systems.',
              ),
              _ServiceCard(
                icon: Icons.school,
                title: 'Mentorship',
                description:
                    'Helping others grow through guidance and knowledge.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _infoTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF22D3EE), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 260,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: _hover ? const Color(0xFF1E293B) : const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF1F2937)),
          boxShadow: _hover
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.icon, color: const Color(0xFF3B82F6), size: 32),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
