import 'package:burtseva_flutter_lab/screens/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginScreen({super.key, required this.onClickedSignUp});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObscure = true;

  void showPassword() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Login',
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
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: showPassword,
                ),
              ),
              controller: passwordController,
              obscureText: _isObscure,
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
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ), (route) => false);
              },
              child: Text(
                'Login',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
              text: TextSpan(
                text: 'Don\'t have account? ',
                style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Register!',
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
