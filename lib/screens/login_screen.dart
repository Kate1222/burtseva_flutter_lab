import 'package:burtseva_flutter_lab/components/button.dart';
import 'package:burtseva_flutter_lab/components/navigator.dart';
import 'package:burtseva_flutter_lab/components/text_button.dart';
import 'package:burtseva_flutter_lab/functions/sign_in.dart';
import 'package:burtseva_flutter_lab/screens/registration_screen.dart';
import 'package:burtseva_flutter_lab/screens/restore_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text field controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: ListView(
          primary: false,
          shrinkWrap: true,
          children: [
            //animated logo
            AnimationLimiter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: AnimationConfiguration.staggeredGrid(
                    position: 0,
                    columnCount: 1,
                    child: Column(
                      children: [
                        FadeInAnimation(
                          duration: const Duration(seconds: 5),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/icons/logo.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FadeInAnimation(
                          child: Text(
                            'AZS',
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //login text
            Center(
              child: Text(
                'Login',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Colors.white,
                ),
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
            //login button
            AzsButton(
              function: () {
                signIn(context, emailController, passwordController);
              },
              label: 'Login',
              textColor: Colors.white,
            ),
            //register text button
            AzsTextButton(
              function: () {
                azsNavigatorPushAndRemoveUntil(
                  context,
                  const RegistrationScreen(),
                );
              },
              mainText: "Don't have account?",
              textButton: 'Register!',
            ),
            //restore text button
            AzsTextButton(
              function: () {
                azsNavigatorPush(context, const RestorePasswordScreen());
              },
              mainText: 'Forgot password?',
              textButton: 'Restore!',
            ),
          ],
        ),
      ),
    );
  }
}
