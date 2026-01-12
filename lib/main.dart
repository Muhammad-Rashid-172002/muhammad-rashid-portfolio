import 'package:flutter/material.dart';
import 'package:rashid_codes/AboutMePage.dart';
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
  // Scroll controller to scroll to sections
  final ScrollController _scrollController = ScrollController();

  // Section keys
  final aboutKey = GlobalKey();
  final resumeKey = GlobalKey();
  final portfolioKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ---------------- TOP NAVIGATION BAR ----------------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            color: const Color(0xFF111827),
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
                Row(
                  children: [
                    _NavItem(
                        label: 'About Me',
                        onTap: () => scrollToSection(aboutKey)),
                    _NavItem(
                        label: 'Resume',
                        onTap: () => scrollToSection(resumeKey)),
                    _NavItem(
                        label: 'Portfolio',
                        onTap: () => scrollToSection(portfolioKey)),
                    _NavItem(
                        label: 'Contact',
                        onTap: () => scrollToSection(contactKey)),
                  ],
                ),
              ],
            ),
          ),

          // ---------------- PAGE CONTENT ----------------
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Each section wrapped in a key
                  Container(key: aboutKey, child: const AboutMePage()),
                  const SizedBox(height: 50),
                  Container(key: resumeKey, child: const ResumePage()),
                  const SizedBox(height: 50),
                  Container(key: portfolioKey, child: const PortfolioPage()),
                  const SizedBox(height: 50),
                  Container(key: contactKey, child: const ContactPage()),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- NAV ITEM ----------------
class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
