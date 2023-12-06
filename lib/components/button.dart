import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzsButton extends StatelessWidget {
  final Function()? function;
  final String label;
  final Color textColor;

  const AzsButton({
    super.key,
    required this.function,
    required this.label,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width - 76,
      margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
      padding: const EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: Colors.black),
      child: TextButton(
        onPressed: function,
        child: Text(
          label,
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w400,
            fontSize: 25,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
