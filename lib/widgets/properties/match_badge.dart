import 'package:flutter/material.dart';
import '../../config/theme.dart';

class MatchBadge extends StatelessWidget {
  final double matchPercentage;

  const MatchBadge({Key? key, required this.matchPercentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentage = matchPercentage.toInt();
    Color badgeColor;
    String label;

    if (percentage >= 80) {
      badgeColor = AppTheme.secondaryColor;
      label = 'تطابق عالی';
    } else if (percentage >= 60) {
      badgeColor = AppTheme.accentColor;
      label = 'تطابق خوب';
    } else {
      badgeColor = Colors.orange;
      label = 'تطابق متوسط';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: badgeColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Colors.white, size: 24),
          const SizedBox(width: 8),
          Text(
            '$label - $percentage%',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
