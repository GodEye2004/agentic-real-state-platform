import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/theme.dart';

class ModeSelection extends StatelessWidget {
  final VoidCallback onVoiceTap;
  final VoidCallback onManualTap;

  const ModeSelection({
    Key? key,
    required this.onVoiceTap,
    required this.onManualTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'چگونه می‌خواهید آگهی خود را ثبت کنید؟',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            _buildSelectionCard(
              context,
              icon: Icons.mic,
              title: 'ثبت هوشمند (مکالمه)',
              description:
                  'به صورت صوتی یا متنی مشخصات ملک را بگویید، ما فرم را پر می‌کنیم.',
              color: AppTheme.primaryColor,
              onTap: onVoiceTap,
            ),
            const SizedBox(height: 24),
            _buildSelectionCard(
              context,
              icon: Icons.edit_note,
              title: 'ثبت دستی',
              description: 'پر کردن فرم مشخصات به صورت مرحله به مرحله.',
              color: AppTheme.secondaryColor,
              onTap: onManualTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3), width: 2),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.withOpacity(0.5),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
