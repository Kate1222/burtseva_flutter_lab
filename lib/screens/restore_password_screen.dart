import 'package:burtseva_flutter_lab/components/button.dart';
import 'package:burtseva_flutter_lab/components/text_field.dart';
import 'package:burtseva_flutter_lab/functions/restore_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestorePasswordScreen extends StatelessWidget {
  const RestorePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

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
            AzsTextField(
              controller: emailController,
              showVisibleButton: false,
              label: 'Email',
            ),
            //send email button
            AzsButton(
              function: () {
                restorePassword(context, emailController);
              },
              label: 'Send email',
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
