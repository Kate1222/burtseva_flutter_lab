import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzsTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool showVisibleButton;
  final String label;

  const AzsTextField({
    super.key,
    required this.controller,
    required this.showVisibleButton,
    required this.label,
  });

  @override
  State<AzsTextField> createState() => _AzsTextFieldState();
}

class _AzsTextFieldState extends State<AzsTextField> {
  bool _isObscure = true;

  void showPassword() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width - 76,
      margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
      padding: const EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.label,
          suffixIcon: widget.showVisibleButton ? IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: showPassword,
          ) : null,
        ),
        controller: widget.controller,
        obscureText: widget.showVisibleButton ? _isObscure : false,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
