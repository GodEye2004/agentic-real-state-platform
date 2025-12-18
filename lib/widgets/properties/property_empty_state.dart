import 'package:flutter/material.dart';
import '../../config/theme.dart';

class PropertyEmptyState extends StatelessWidget {
  const PropertyEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off, size: 64, color: AppTheme.textLight),
          const SizedBox(height: 16),
          Text(
            'ملکی پیدا نشد',
            textDirection: TextDirection.rtl,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            'لطفا جستجوی خود را تغییر دهید',
            textDirection: TextDirection.rtl,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.textLight),
          ),
        ],
      ),
    );
  }
}
