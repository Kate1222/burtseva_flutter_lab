import 'package:firebase_auth/firebase_auth.dart';
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

  signIn() async {
    if (emailController.text == '' || passwordController.text == '') {
      snackBar("Input email and password!");
    } else {
      try {
        setState(() {
          const Center(child: CircularProgressIndicator());
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        snackBar(e.toString());
      }
    }
  }

  void snackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: ListView(
          primary: false,
          shrinkWrap: true,
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
                onPressed: signIn,
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
            Center(
              child: Padding(
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
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                  text: TextSpan(
                    text: 'Forgot password? ',
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        /*recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,*/
                        text: 'Restore',
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
            ),
          ],
        ),
      ),
    );
  }
}
