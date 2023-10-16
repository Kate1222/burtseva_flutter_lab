import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Gas station',
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Colors.white
          ),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Types of fuel',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: Colors.white
              ),
            ),
          ),
          Container(
            height: 45,
            width: screenWidth - 76,
            margin: const EdgeInsets.only(top: 78, left: 38, right: 38),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'A-92',
                style: GoogleFonts.raleway(
                  fontSize: 32,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
          Container(
            height: 45,
            width: screenWidth - 76,
            margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'A-95',
                style: GoogleFonts.raleway(
                    fontSize: 32,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
          Container(
            height: 45,
            width: screenWidth - 76,
            margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Diesel',
                style: GoogleFonts.raleway(
                    fontSize: 32,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
          Container(
            height: 45,
            width: screenWidth - 76,
            margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Gaz',
                style: GoogleFonts.raleway(
                    fontSize: 32,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
