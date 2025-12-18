import 'package:flutter/material.dart';
import '../models/models.dart';
import '../config/theme.dart';
import '../widgets/properties/match_badge.dart';
import '../widgets/properties/property_info_section.dart';
import '../widgets/properties/property_facilities.dart';
import '../widgets/properties/property_action_buttons.dart';

class PropertyDetailScreen extends StatelessWidget {
  final Property property;

  const PropertyDetailScreen({Key? key, required this.property})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: AppTheme.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  property.title,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.primaryColor,
                      AppTheme.primaryColor.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.home_work,
                    size: 80,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),

          // content
          SliverToBoxAdapter(
            child: Column(
              children: [
                // match badge
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: MatchBadge(matchPercentage: property.matchPercentage),
                ),

                // price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'قیمت',
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textLight,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        property.formattedPrice,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // main info
                PropertyInfoSection(property: property),

                const SizedBox(height: 16),

                // facilities
                if (property.facilities.isNotEmpty)
                  PropertyFacilities(facilities: property.facilities),

                const SizedBox(height: 24),

                // action buttons
                PropertyActionButtons(
                  phone: property.phone,
                  title: property.title,
                  price: property.formattedPrice,
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
