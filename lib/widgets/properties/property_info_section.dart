import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../models/models.dart';

class PropertyInfoSection extends StatelessWidget {
  final Property property;

  const PropertyInfoSection({Key? key, required this.property})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'مشخصات ملک',
            textDirection: TextDirection.rtl,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            context,
            icon: Icons.square_foot,
            label: 'متراژ',
            value: property.formattedArea,
            color: AppTheme.secondaryColor,
          ),
          const Divider(height: 24),
          _buildDetailRow(
            context,
            icon: Icons.location_on,
            label: 'موقعیت',
            value: property.location,
            color: AppTheme.errorColor,
          ),
          if (property.bedrooms != null) ...[
            const Divider(height: 24),
            _buildDetailRow(
              context,
              icon: Icons.bed,
              label: 'تعداد اتاق',
              value: '${property.bedrooms} خواب',
              color: AppTheme.primaryColor,
            ),
          ],
          if (property.yearBuilt != null) ...[
            const Divider(height: 24),
            _buildDetailRow(
              context,
              icon: Icons.calendar_today,
              label: 'سال ساخت',
              value: '${property.yearBuilt} شمسی',
              color: Colors.orange,
            ),
          ],
          if (property.documentType != null) ...[
            const Divider(height: 24),
            _buildDetailRow(
              context,
              icon: Icons.description,
              label: 'نوع سند',
              value: property.documentType!,
              color: Colors.purple,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                label,
                textDirection: TextDirection.rtl,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppTheme.textLight),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
      ],
    );
  }
}
