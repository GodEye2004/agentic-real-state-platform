import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Icon(
              Icons
                  .home_work_rounded, // Real estate related icon based on project name "agent front engin" / "agentic-real-state-platform"
              color: AppTheme.primaryColor,
              size: 32,
            ),
          ),
        ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack),
        const SizedBox(height: 24),
        Text(
          title,
          style: GoogleFonts.vazirmatn(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
            height: 1.2,
          ),
        ).animate().fadeIn().slideX(begin: -0.2, end: 0),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: GoogleFonts.vazirmatn(
            fontSize: 16,
            color: AppTheme.textSecondary,
            height: 1.5,
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2, end: 0),
      ],
    );
  }
}
