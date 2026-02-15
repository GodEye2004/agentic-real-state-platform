import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/properties/propertiesResponse/properties_response.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePropertyCard extends StatelessWidget {
  final Property property;
  const HomePropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8F1F8), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1565C0).withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Image Container
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFFE3F2FD), const Color(0xFFBBDEFB)],
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.image_outlined,
                size: 48,
                color: const Color(0xFF1565C0).withOpacity(0.3),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    property.title,
                    style: GoogleFonts.vazirmatn(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1A1A),
                      letterSpacing: -0.3,
                    ),
                    textDirection: TextDirection.rtl,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1565C0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${property.price} تومان',
                        style: GoogleFonts.vazirmatn(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          property.district,
                          style: GoogleFonts.vazirmatn(
                            fontSize: 13,
                            color: const Color(0xFF64748B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: const Color(0xFF1565C0),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        const Color(0xFF1565C0).withOpacity(0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildInfoItem(
                      Icons.layers_outlined,
                      'طبقه ${property.floor}',
                    ),
                    _buildDivider(),
                    _buildInfoItem(
                      Icons.bed_outlined,
                      '${property.bedrooms} خواب',
                    ),
                    _buildDivider(),
                    _buildInfoItem(
                      Icons.aspect_ratio_outlined,
                      '${property.area} متر',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.vazirmatn(
            fontSize: 12,
            color: const Color(0xFF475569),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 6),
        Icon(icon, size: 18, color: const Color(0xFF1565C0)),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(width: 1, height: 20, color: const Color(0xFFE8F1F8));
  }
}
