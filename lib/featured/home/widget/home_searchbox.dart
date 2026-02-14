import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSearchbox extends StatefulWidget {
  const HomeSearchbox({super.key});

  @override
  State<HomeSearchbox> createState() => _HomeSearchboxState();
}

class _HomeSearchboxState extends State<HomeSearchbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'جست و جو ....',
          hintStyle: GoogleFonts.vazirmatn(
            fontSize: 16.0,
            color: Colors.grey[600],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
        ),
      ),
    );
  }
}
