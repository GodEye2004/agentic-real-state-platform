import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/properties/propertiesResponse/properties_response.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePropertyCard extends StatelessWidget {
  final Property property;
  const HomePropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .end,
        children: [
          // placeholder for image , for future
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Center(
              child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: .all(12),
            child: Column(
              crossAxisAlignment: .end,
              children: [
                Text(
                  property.title,
                  style: GoogleFonts.vazirmatn(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      '${property.price} تومان',
                      style: GoogleFonts.vazirmatn(
                        fontSize: 14,
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${property.district}',
                      style: GoogleFonts.vazirmatn(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    _buildInfoItem(Icons.aspect_ratio, '${property.area} متر'),
                    _buildInfoItem(Icons.bed, '${property.bedrooms} خواب'),
                    _buildInfoItem(Icons.layers, 'طبقه ${property.floor}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoItem(IconData icon, String label) {
  return Row(
    children: [
      Text(
        label,
        style: GoogleFonts.vazirmatn(fontSize: 12, color: Colors.grey[600]),
      ),
      const SizedBox(width: 4),
      Icon(icon, size: 16, color: Colors.grey[600]),
    ],
  );
}
