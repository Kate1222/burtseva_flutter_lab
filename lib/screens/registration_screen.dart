import 'package:burtseva_flutter_lab/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'home_screen.dart';

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

  void showPassword1() {
    setState(() {
      _isObscure1 = !_isObscure1;
    });
  }

  void showPassword2() {
    setState(() {
      _isObscure2 = !_isObscure2;
    });
  }

  //snackBar
  void snackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  //registration
  Future registration() async {
    if (emailController.text == '' ||
        passwordController.text == '' ||
        repeatPasswordController.text == '') {
      snackBar('Please, input data');
    } else if (passwordController.text != repeatPasswordController.text) {
      snackBar('Wrong confirm password!');
    } else {
      try {
        try {
          FirebaseAuth.instance.signOut();
        }
        catch (e) {
          print(e);
        }
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': emailController.text,
          'uid': userCredential.user!.uid,
          'admin': 'false',
          'bonuses': 0,
        });
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ), (route) => false);
      } on FirebaseAuthException catch (e) {
        snackBar(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: ListView(
          primary: false,
          shrinkWrap: true,
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
                    onPressed: showPassword1,
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
                    onPressed: showPassword2,
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
              padding: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35), color: Colors.black),
              child: TextButton(
                onPressed: registration,
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
            Center(
              child: Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
