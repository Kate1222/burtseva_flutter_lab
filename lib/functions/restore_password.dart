//restore password function
import 'package:burtseva_flutter_lab/functions/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future restorePassword(BuildContext context, TextEditingController emailController) async {
  //check text field text
  if (emailController.text == '') {
    snackBar(context, 'Input email address!');
  } else {
    try {
      //send restore email
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      snackBar(context, 'Mail send successful!');
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message.toString());
    }
  }
}