import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF020617),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: const PortfolioContent(),
        ),
      ),
    );
  }
}

class PortfolioContent extends StatefulWidget {
  const PortfolioContent({super.key});

  @override
  State<PortfolioContent> createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent> {
  String selectedFilter = 'All';

  List<PortfolioProject> get filteredProjects {
    if (selectedFilter == 'All') return projects;

    return projects
        .where((p) =>
            p.tech.toLowerCase().contains(selectedFilter.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          const Text(
            'Selected Work',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'A collection of apps and products I’ve built',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 28),

          /// FILTERS
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['All', 'Flutter', 'AI', 'Web', 'UI/UX']
                  .map(
                    (filter) => GestureDetector(
                      onTap: () => setState(() => selectedFilter = filter),
                      child: FilterChipItem(
                        title: filter,
                        active: selectedFilter == filter,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          const SizedBox(height: 32),

          /// GRID
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 900;

              return GridView.builder(
                itemCount: filteredProjects.length,
                shrinkWrap: true, // important!
                physics:
                    const NeverScrollableScrollPhysics(), // so scrolls with parent
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isWide ? 3 : 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (context, index) {
                  return PortfolioCard(project: filteredProjects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}


/* -------------------------------------------------------------------------- */
/*                                    DATA                                    */
/* -------------------------------------------------------------------------- */

class PortfolioProject {
  final String title;
  final String tech;
  final String image;
  final String github;

  const PortfolioProject({
    required this.title,
    required this.tech,
    required this.image,
    required this.github,
  });
}

const List<PortfolioProject> projects = [
  PortfolioProject(
    title: 'IELTS AI Study Assistant',
    tech: 'Flutter • AI • Firebase',
    image: 'assets/ILETS.png',
    github:
        'https://github.com/Muhammad-Rashid-172002/IELTS-AI-Study-Assistant',
  ),
  PortfolioProject(
    title: 'NutriScan',
    tech: 'Flutter • Health',
    image: 'assets/nutriscan.png',
    github: 'https://github.com/Muhammad-Rashid-172002/intership_Task',
  ),
  PortfolioProject(
    title: 'Expense Tracker',
    tech: 'Flutter • Hive',
    image: 'assets/expanse_tracker.png',
    github: 'https://github.com/Muhammad-Rashid-172002/Artha-Expense-',
  ),
  PortfolioProject(
    title: 'Chess Game',
    tech: 'Flutter • Game',
    image: 'assets/chess_game.png',
    github: 'https://github.com/Muhammad-Rashid-172002/Chess_Game',
  ),
  PortfolioProject(
    title: 'Fitness UI',
    tech: 'Flutter • UI',
    image: 'assets/fitness_ui.png',
    github: 'https://github.com/Muhammad-Rashid-172002/Fitness_App',
  ),
  PortfolioProject(
    title: 'Makkah Journey App',
    tech: 'Flutter • Travel',
    image: 'assets/Makkah-Journey.png',
    github: 'https://github.com/Muhammad-Rashid-172002/Makkah-Journey',
  ),
  PortfolioProject(
    title: 'Company Website',
    tech: 'Web Project',
    image: 'assets/company_Web.png',
    github:
        'https://github.com/Muhammad-Rashid-172002/Noor-Diesel-Company-Website',
  ),
  PortfolioProject(
    title: 'GenieGPT',
    tech: 'Flutter • AI • Chatbot',
    image: 'assets/gpt.jpeg',
    github: 'https://github.com/Muhammad-Rashid-172002/GenieGPT',
  ),
];

/* -------------------------------------------------------------------------- */
/*                                FILTER CHIP                                 */
/* -------------------------------------------------------------------------- */

class FilterChipItem extends StatelessWidget {
  final String title;
  final bool active;

  const FilterChipItem({
    super.key,
    required this.title,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF38BDF8) : const Color(0xFF020617),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: active ? Colors.transparent : const Color(0xFF1E293B),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: active ? Colors.black : Colors.grey[300],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                               PORTFOLIO CARD                               */
/* -------------------------------------------------------------------------- */

class PortfolioCard extends StatefulWidget {
  final PortfolioProject project;

  const PortfolioCard({super.key, required this.project});

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  bool hover = false;

  Future<void> _openGithub() async {
    final uri = Uri.parse(widget.project.github);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform:
            hover ? (Matrix4.identity()..translate(0, -6)) : Matrix4.identity(),
        child: Material(
          color: const Color(0xFF020617),
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: _openGithub,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF1E293B)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// IMAGE
                  Container(
                    height: 150,
                    padding: const EdgeInsets.all(14),
                    child: Image.asset(
                      widget.project.image,
                      fit: BoxFit.contain,
                    ),
                  ),

                  /// TEXT
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.project.tech,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'View on GitHub →',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF38BDF8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
