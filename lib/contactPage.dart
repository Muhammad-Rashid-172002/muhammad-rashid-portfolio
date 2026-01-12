import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF020617),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: const ContactContent(),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                CONTACT CONTENT                              */
/* -------------------------------------------------------------------------- */

class ContactContent extends StatefulWidget {
  const ContactContent({super.key});

  @override
  State<ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  // --------------------- SEND EMAIL ---------------------
  Future<void> _sendEmail() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final subject = _subjectController.text;
    final message = _messageController.text;

    final mailtoUrl =
        'mailto:muhammadrashid172002@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent("Name: $name\nEmail: $email\n\n$message")}';

    if (await canLaunchUrl(Uri.parse(mailtoUrl))) {
      await launchUrl(Uri.parse(mailtoUrl));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open email app')));
    }
  }

  // --------------------- CALL ---------------------
  Future<void> _callNumber() async {
    final uri = Uri.parse('tel:+923195176014');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  // --------------------- WHATSAPP ---------------------
  Future<void> _openWhatsApp() async {
    final uri = Uri.parse('https://wa.me/923195176014');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  // --------------------- LINKEDIN ---------------------
  Future<void> _openLinkedIn() async {
    final uri = Uri.parse(
      'https://www.linkedin.com/in/muhammad-rashid-flutterdev/',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  // --------------------- GITHUB ---------------------
  Future<void> _openGitHub() async {
    final uri = Uri.parse('https://github.com/Muhammad-Rashid-172002');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF020617),
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xFF1E293B)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Me',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Get in touch for projects, collaborations, or questions.',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(height: 32),

            /// FORM
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                    controller: _nameController,
                    label: 'Name',
                    hint: 'John Doe',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'example@email.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _subjectController,
                    label: 'Subject',
                    hint: 'Project Inquiry',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _messageController,
                    label: 'Message',
                    hint: 'Your message here...',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 24),

                  /// SEND BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _sendEmail();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF38BDF8),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Send Message',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            /// SOCIAL LINKS (CALL, WHATSAPP, EMAIL, LINKEDIN, GITHUB)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon(
                  icon: Icons.call,
                  label: 'Call',
                  onTap: _callNumber,
                ),
                const SizedBox(width: 16),
                _socialIcon(
                  icon: FontAwesomeIcons.whatsapp,
                  label: 'WhatsApp',
                  onTap: _openWhatsApp,
                ),

                const SizedBox(width: 16),
                _socialIcon(
                  icon: Icons.email,
                  label: 'Email',
                  onTap: _sendEmail,
                ),
                const SizedBox(width: 16),
                _socialIcon(
                  icon: FontAwesomeIcons.linkedin,
                  label: 'WhatsApp',
                  onTap: _openWhatsApp,
                ),

                const SizedBox(width: 16),
                _socialIcon(
                  icon: FontAwesomeIcons.github,
                  label: 'GitHub',
                  onTap: _openGitHub,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: const Color(0xFF111827),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (label == 'Email' && !value.contains('@')) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }

  Widget _socialIcon({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xFF38BDF8), size: 28),
      ),
    );
  }
}
