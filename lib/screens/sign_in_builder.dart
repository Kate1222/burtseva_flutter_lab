import 'package:burtseva_flutter_lab/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignInBuilder extends StatefulWidget {
  const SignInBuilder({super.key});

  @override
  State<SignInBuilder> createState() => _SignInBuilderState();
}

class _SignInBuilderState extends State<SignInBuilder> {
  bool screen = true;
  @override
  Widget build(BuildContext context) =>
      screen ? LoginScreen(onClickedSignUp: toggle) :
      RegistrationScreen(onClickedSignIn: toggle);

  void toggle() => setState(() => screen = !screen);
}
