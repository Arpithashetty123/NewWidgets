import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buttonContainer(double width, String text, bool isVideoSelected) {
  return Container(
    height: 50,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: isVideoSelected ? Colors.deepPurple : const Color.fromARGB(255, 185, 160, 232),
    ),
    child: Center(
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}







