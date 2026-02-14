import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBox extends StatefulWidget {
  final String title;
  final Icon icon;
  const HomeBox({super.key, required this.title, required this.icon});

  @override
  State<HomeBox> createState() => _HomeBoxState();
}

class _HomeBoxState extends State<HomeBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150,
      height: 52,
      padding: .symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        // mainAxisAlignment: .spaceEvenly,
        children: [
          Icon(widget.icon.icon, size: 20, color: Colors.blueAccent),
          const SizedBox(width: 12),
          Text(
            widget.title,
            style: GoogleFonts.vazirmatn(fontSize: 14.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
