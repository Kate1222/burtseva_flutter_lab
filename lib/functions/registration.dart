import 'package:burtseva_flutter_lab/functions/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

Future registration(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController repeatPasswordController) async {
  //check text field text
  if (emailController.text == '' ||
      passwordController.text == '' ||
      repeatPasswordController.text == '') {
    snackBar(context, 'Please, input data');
  } else if (passwordController.text != repeatPasswordController.text) {
    snackBar(context, 'Wrong confirm password!');
  } else {
    try {
      //create new user
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      //write info about user to database
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': emailController.text,
        'uid': userCredential.user!.uid,
        'admin': 'false',
        'bonuses': 0,
      });

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
      //snack bar error
      // ignore: use_build_context_synchronously
      snackBar(context, e.toString());
    }
  }
}
