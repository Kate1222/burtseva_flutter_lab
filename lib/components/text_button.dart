import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzsTextButton extends StatelessWidget {
  final Function()? function;
  final String mainText;
  final String textButton;

  const AzsTextButton({
    super.key,
    required this.function,
    required this.mainText,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mainText,
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextButton(
            onPressed: function,
            child: Text(
              textButton,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
