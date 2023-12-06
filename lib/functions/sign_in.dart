import 'package:burtseva_flutter_lab/functions/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

signIn(BuildContext context, TextEditingController emailController, TextEditingController passwordController) async {
  //check text field text
  if (emailController.text == '' || passwordController.text == '') {
    snackBar(context, "Input email and password!");
  } else {
    try {
      //login to user account
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      //navigate to home screen
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
              (route) => false);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      snackBar(context, e.toString());
    }
  }
}