import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          const Text(
            'Portfolio',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 16),

          // FILTER TABS
          Row(
            children: const [
              _FilterChip(title: 'All', active: true),
              _FilterChip(title: 'App Development'),
              _FilterChip(title: 'Web Development'),
              _FilterChip(title: 'UI/UX'),
            ],
          ),

          const SizedBox(height: 32),

          // GRID
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1.25,
              children: const [
                _PortfolioCard(
                  title: 'Smart Bank App',
                  category: 'Flutter • Firebase',
                ),
                _PortfolioCard(
                  title: 'Blog Website',
                  category: 'Next.js',
                ),
                _PortfolioCard(
                  title: 'Rental App UI',
                  category: 'Flutter UI/UX',
                ),
                _PortfolioCard(
                  title: 'IdeaFlow',
                  category: 'Web Development',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- FILTER CHIP ----------------
class _FilterChip extends StatelessWidget {
  final String title;
  final bool active;

  const _FilterChip({
    required this.title,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFF97316) : const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: active ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// ---------------- PORTFOLIO CARD ----------------
class _PortfolioCard extends StatelessWidget {
  final String title;
  final String category;

  const _PortfolioCard({
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFEDD5),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE PLACEHOLDER
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.image_outlined,
                size: 40,
                color: Colors.black38,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
