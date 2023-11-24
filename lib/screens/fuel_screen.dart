import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FuelScreen extends StatelessWidget {
  final String title;
  const FuelScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          title,
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w700, fontSize: 36, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Container(),
    );
  }
}
