import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/property_details_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/models.dart';
import '../config/theme.dart';

class PropertyCard extends StatelessWidget {
  final Property property;

  const PropertyCard({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailScreen(property: property),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // هدر با درصد تطابق
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryColor.withOpacity(0.8),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      property.title,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildMatchBadge(context),
                ],
              ),
            ),
            
            // محتوا
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // قیمت
                  _buildInfoRow(
                    context,
                    icon: Icons.paid,
                    label: 'قیمت',
                    value: property.formattedPrice,
                    iconColor: AppTheme.accentColor,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // متراژ و موقعیت
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoRow(
                          context,
                          icon: Icons.square_foot,
                          label: 'متراژ',
                          value: property.formattedArea,
                          iconColor: AppTheme.secondaryColor,
                        ),
                      ),
                      Expanded(
                        child: _buildInfoRow(
                          context,
                          icon: Icons.location_on,
                          label: 'موقعیت',
                          value: property.location,
                          iconColor: AppTheme.errorColor,
                        ),
                      ),
                    ],
                  ),
                  
                  // اتاق و سال ساخت
                  if (property.bedrooms != null || property.yearBuilt != null) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (property.bedrooms != null)
                          Expanded(
                            child: _buildInfoRow(
                              context,
                              icon: Icons.bed,
                              label: 'اتاق',
                              value: '${property.bedrooms} خواب',
                              iconColor: AppTheme.primaryColor,
                            ),
                          ),
                        if (property.yearBuilt != null)
                          Expanded(
                            child: _buildInfoRow(
                              context,
                              icon: Icons.calendar_today,
                              label: 'سال ساخت',
                              value: property.yearBuilt.toString(),
                              iconColor: Colors.orange,
                            ),
                          ),
                      ],
                    ),
                  ],
                  
                  // امکانات
                  if (property.facilities.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.end,
                      children: property.facilities.map((facility) {
                        return _buildFacilityChip(context, facility);
                      }).toList(),
                    ),
                  ],
                  
                  // دکمه تماس
                  if (property.phone != null) ...[
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _makePhoneCall(property.phone!),
                        icon: const Icon(Icons.phone, size: 20),
                        label: Text(
                          'تماس با مالک',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.secondaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchBadge(BuildContext context) {
    final percentage = property.matchPercentage.toInt();
    Color badgeColor;
    
    if (percentage >= 80) {
      badgeColor = AppTheme.secondaryColor;
    } else if (percentage >= 60) {
      badgeColor = AppTheme.accentColor;
    } else {
      badgeColor = Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            '$percentage%',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                label,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textLight,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 20,
          ),
        ),
      ],
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.primaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            facility,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            icon,
            color: AppTheme.primaryColor,
            size: 16,
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }
}