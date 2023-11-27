import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestorePasswordScreen extends StatelessWidget {
  const RestorePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    final screenWidth = MediaQuery.of(context).size.width;

    void snackBar(String text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }

    //restore password function
    Future restorePassword() async {
      //check text field text
      if (emailController.text == '') {
        snackBar('Input email address!');
      }
      else {
        try {
          //send restore email
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: emailController.text.trim());
          snackBar('Mail send successful!');
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        } on FirebaseAuthException catch (e) {
          snackBar(e.message.toString());
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Restore password',
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.w700, fontSize: 28, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: ListView(
          primary: false,
          shrinkWrap: true,
          children: [
            //email text field
            Container(
              height: 45,
              width: screenWidth - 76,
              margin: const EdgeInsets.only(left: 38, right: 38),
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
            //send email button
            Container(
              height: 45,
              width: screenWidth - 76,
              margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
              padding: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35), color: Colors.black),
              child: TextButton(
                onPressed: restorePassword,
                child: Text(
                  'Send email',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white,
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
