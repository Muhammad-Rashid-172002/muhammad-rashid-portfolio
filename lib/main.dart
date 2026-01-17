import 'package:flutter/material.dart';
import 'package:rashid_codes/AboutMePage.dart';
import 'package:rashid_codes/Footer_Widget.dart';
import 'package:rashid_codes/PortfolioPage.dart';
import 'package:rashid_codes/Resume_section.dart';
import 'package:rashid_codes/contactPage.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muhammad Rashid Portfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        fontFamily: 'Inter',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final aboutKey = GlobalKey();
  final resumeKey = GlobalKey();
  final portfolioKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleNav(GlobalKey key) {
    Navigator.pop(context); // close drawer if open
    scrollTo(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _MobileDrawer(
        onAbout: () => _handleNav(aboutKey),
        onResume: () => _handleNav(resumeKey),
        onPortfolio: () => _handleNav(portfolioKey),
        onContact: () => _handleNav(contactKey),
      ),
      body: Column(
        children: [
          /// ===================== NAV BAR =====================
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 900;

              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                color: const Color(0xFF020617),
                child: Row(
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

                    /// DESKTOP BUTTONS
                    if (isDesktop)
                      Row(
                        children: [
                          _NavButton(
                              label: 'About',
                              onTap: () => scrollTo(aboutKey)),
                          _NavButton(
                              label: 'Resume',
                              onTap: () => scrollTo(resumeKey)),
                          _NavButton(
                              label: 'Portfolio',
                              onTap: () => scrollTo(portfolioKey)),
                          _NavButton(
                              label: 'Contact',
                              onTap: () => scrollTo(contactKey)),
                        ],
                      ),

                    /// MOBILE HAMBURGER
                    if (!isDesktop)
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.menu,
                              color: Colors.white),
                          onPressed: () =>
                              Scaffold.of(context).openDrawer(),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),

          /// ===================== CONTENT =====================
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(key: aboutKey, child: const AboutMePage()),
                  const SizedBox(height: 80),
                  Container(key: resumeKey, child: const ResumePage()),
                  const SizedBox(height: 80),
                  Container(key: portfolioKey, child: const PortfolioPage()),
                  const SizedBox(height: 80),
                  Container(key: contactKey, child: const ContactPage()),
                  const SizedBox(height: 80),
                  const PortfolioFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ===================== DESKTOP NAV BUTTON =====================
class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        ),
        child: Text(label),
      ),
    );
  }
}

/// ===================== MOBILE DRAWER =====================
class _MobileDrawer extends StatelessWidget {
  final VoidCallback onAbout;
  final VoidCallback onResume;
  final VoidCallback onPortfolio;
  final VoidCallback onContact;

  const _MobileDrawer({
    required this.onAbout,
    required this.onResume,
    required this.onPortfolio,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF020617),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Navigation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          _DrawerItem('About Me', onAbout),
          _DrawerItem('Resume', onResume),
          _DrawerItem('Portfolio', onPortfolio),
          _DrawerItem('Contact', onContact),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DrawerItem(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(color: Colors.grey, fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
