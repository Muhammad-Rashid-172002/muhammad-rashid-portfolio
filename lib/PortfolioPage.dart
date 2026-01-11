import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A), // dark background
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
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          // FILTER TABS (scrollable)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                _FilterChip(title: 'All', active: true),
                _FilterChip(title: 'App Development'),
                _FilterChip(title: 'Web Development'),
                _FilterChip(title: 'UI/UX'),
              ],
            ),
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
        color: active ? const Color(0xFF3B82F6) : const Color(0xFF1F2937), // dark inactive
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: active ? Colors.white : Colors.grey[300],
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF111827), // card dark color
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFF1F2937)), // subtle border
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE PLACEHOLDER
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2937),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(18),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 40,
                    color: Colors.grey,
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
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
