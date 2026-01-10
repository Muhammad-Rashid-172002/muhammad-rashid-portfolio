import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // TOP BAR
              _topBar(),

              const SizedBox(height: 30),

              // MAIN CONTENT
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT PROFILE CARD
                    _profileCard(),

                    const SizedBox(width: 30),

                    // RIGHT CONTENT
                    Expanded(child: _rightContent()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- TOP BAR ----------------
  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Muhammad Rashid',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: const [
              _NavItem(icon: Icons.home, label: 'Home', active: true),
              _NavItem(icon: Icons.description, label: 'Resume'),
              _NavItem(icon: Icons.work, label: 'Work'),
              _NavItem(icon: Icons.mail, label: 'Contact'),
            ],
          ),
        ),
      ],
    );
  }

  // ---------------- LEFT PROFILE ----------------
  Widget _profileCard() {
    return SizedBox(
      width: 300,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('assets/Rashid_Profile_Pic_01.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Muhammad Rashid',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Flutter Developer',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            _infoTile(Icons.phone, '+92 319 5176014'),
            _infoTile(Icons.email, 'muhammadrashid172002@gmail.com'),
            _infoTile(Icons.location_on, 'Pakistan'),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Download Resume'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- RIGHT CONTENT ----------------
  Widget _rightContent() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(22),
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
                Expanded(
                  child: Divider(color: Color(0xFF3B82F6), thickness: 2),
                ),
              ],
            ),

            const SizedBox(height: 16),

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

            // SERVICES GRID
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
      ),
    );
  }

  // ---------------- INFO TILE ----------------
  static Widget _infoTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF22D3EE), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}

// ---------------- NAV ITEM ----------------
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

// ---------------- SERVICE CARD ----------------
class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF1F2937)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Color(0xFF3B82F6), size: 30),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
