import 'package:flutter/material.dart';
import '../../config/theme.dart';

class PropertyFacilities extends StatelessWidget {
  final List<String> facilities;

  const PropertyFacilities({Key? key, required this.facilities})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (facilities.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'امکانات',
            textDirection: TextDirection.rtl,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.end,
            children: facilities.map((facility) {
              return _buildFacilityChip(context, facility);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFacilityChip(BuildContext context, String facility) {
    IconData icon;
    switch (facility) {
      case 'پارکینگ':
        icon = Icons.local_parking;
        break;
      case 'آسانسور':
        icon = Icons.elevator;
        break;
      case 'انباری':
        icon = Icons.storage;
        break;
      default:
        icon = Icons.check;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            facility,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Icon(icon, color: AppTheme.primaryColor, size: 20),
        ],
      ),
    );
  }
}
