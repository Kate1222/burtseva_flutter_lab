import 'package:burtseva_flutter_lab/components/button.dart';
import 'package:burtseva_flutter_lab/functions/settings_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            //logout button
            AzsButton(
              function: () {
                azsLogout(context);
              },
              label: 'Logout',
              textColor: Colors.white,
            ),
            //remove account button
            AzsButton(
              function: () {
                azsRemoveAccount(context);
              },
              label: 'Remove account',
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
