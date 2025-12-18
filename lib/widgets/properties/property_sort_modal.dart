import 'package:flutter/material.dart';
import '../../config/theme.dart';

class PropertySortModal extends StatelessWidget {
  final String currentSort;
  final Function(String) onSortSelected;

  const PropertySortModal({
    Key? key,
    required this.currentSort,
    required this.onSortSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'مرتب‌سازی بر اساس',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildSortOption(context, 'تطابق', 'match', Icons.verified),
          _buildSortOption(context, 'قیمت', 'price', Icons.paid),
          _buildSortOption(context, 'متراژ', 'area', Icons.square_foot),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSortOption(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    final isSelected = currentSort == value;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryColor
              : AppTheme.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : AppTheme.primaryColor,
        ),
      ),
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppTheme.primaryColor)
          : null,
      onTap: () => onSortSelected(value),
    );
  }
}
