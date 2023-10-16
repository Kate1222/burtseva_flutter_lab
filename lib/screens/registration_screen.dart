import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const RegistrationScreen({super.key, required this.onClickedSignIn});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  bool _isObscure1 = true;
  bool _isObscure2 = true;

  void showPassword(bool isObscure) {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Registration',
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: Colors.white),
          ),
        ),
        Container(
          height: 45,
          width: screenWidth - 76,
          margin: const EdgeInsets.only(top: 78, left: 38, right: 38),
          padding: const EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35), color: Colors.white),
          child: TextField(
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: 'Email'),
            controller: emailController,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 45,
          width: screenWidth - 76,
          margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
          padding: const EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure1 ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: (){
                  showPassword(_isObscure1);
                },
              ),
            ),
            controller: passwordController,
            obscureText: _isObscure1,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 45,
          width: screenWidth - 76,
          margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
          padding: const EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Repeat password',
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure2 ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: (){
                  showPassword(_isObscure2);
                },
              ),
            ),
            controller: repeatPasswordController,
            obscureText: _isObscure2,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 45,
          width: screenWidth - 76,
          margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
          padding: const  EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.black
          ),
          child: TextButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: Text(
              'Registration',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: RichText(
            text: TextSpan(
              text: 'Have account? ',
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignIn,
                  text: 'Login!',
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    );
  }
}
