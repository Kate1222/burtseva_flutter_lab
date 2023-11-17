import 'package:burtseva_flutter_lab/screens/sign_in_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: ListView(
          primary: false,
          shrinkWrap: true,
          children: [
            Container(
              height: 45,
              width: screenWidth - 76,
              margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35), color: Colors.white),
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SignInBuilder()),
                        (route) => false);
                  },
                  child: Text(
                    'Logout',
                    style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              height: 45,
              width: screenWidth - 76,
              margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35), color: Colors.white),
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .authStateChanges()
                        .listen((User? user) {
                      user?.delete();
                    });
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SignInBuilder()),
                        (route) => false);
                  },
                  child: Text(
                    'Remove account',
                    style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
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
