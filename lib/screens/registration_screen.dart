import 'package:burtseva_flutter_lab/components/button.dart';
import 'package:burtseva_flutter_lab/components/navigator.dart';
import 'package:burtseva_flutter_lab/components/text_button.dart';
import 'package:burtseva_flutter_lab/components/text_field.dart';
import 'package:burtseva_flutter_lab/functions/registration.dart';
import 'package:burtseva_flutter_lab/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            //email text field
            AzsTextField(
              controller: emailController,
              showVisibleButton: false,
              label: 'Email',
            ),
            //password text field
            AzsTextField(
              controller: passwordController,
              showVisibleButton: true,
              label: 'Password',
            ),
            //repeat password text field
            AzsTextField(
              controller: repeatPasswordController,
              showVisibleButton: true,
              label: 'Repeat password',
            ),
            //registration button
            AzsButton(
              function: () {
                registration(
                  context,
                  emailController,
                  passwordController,
                  repeatPasswordController,
                );
              },
              label: 'Registration',
              textColor: Colors.white,
            ),
            //login text button
            AzsTextButton(
              function: () {
                azsNavigatorPushAndRemoveUntil(context, const LoginScreen(),);
              },
              mainText: 'Have account?',
              textButton: 'Login!',
            ),
          ],
        ),
      ),
    );
  }
}
