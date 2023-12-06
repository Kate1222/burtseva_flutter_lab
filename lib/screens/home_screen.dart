import 'package:burtseva_flutter_lab/components/button.dart';
import 'package:burtseva_flutter_lab/components/navigator.dart';
import 'package:burtseva_flutter_lab/screens/settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../functions/home_screen_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String modeStatus = 'Disabled';

  void changeModeStatus() {
    setState(() {
      if (modeStatus == 'Disabled') {
        modeStatus = 'Enabled';
      } else {
        modeStatus = 'Disabled';
      }
    });
  }

  bool isAdmin = false;
  int bonusesValue = 0;

  Future<void> getUserStatus() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final data =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    setState(() {
      if (data['admin'] == 'true') {
        isAdmin = true;
      }
      bonusesValue = data['bonuses'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Types of fuel',
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.w700, fontSize: 36, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton (
          icon: const Icon(Icons.person, color: Colors.white,),
          onPressed: () {
            changeUserStatus();
            setState(() {
              isAdmin = !isAdmin;
            });
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                azsNavigatorPush(context, const SettingsScreen());
              })
        ],
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          //bonuses counter
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              'Bonuses: $bonusesValue',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: Center(
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  //admin mode display
                  isAdmin
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width - 32,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Admin mode ',
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '"$modeStatus"',
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                  color: modeStatus == 'Enabled'
                                      ? Colors.greenAccent
                                      : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  //A-92 button
                  AzsButton(
                    function: () {
                      //open screen depending mode
                      if (modeStatus == 'Enabled') {
                        openAdminFuelScreen(
                            context, 'A-92'); //open admin screen
                      } else {
                        availabilityCheck(context, 'A-92',
                            getUserStatus); //open user screen or 'sold out' snack bar
                      }
                    },
                    label: 'A-92',
                    textColor: Colors.white,
                  ),
                  //A-95 button
                  AzsButton(
                    function: () {
                      //open screen depending mode
                      if (modeStatus == 'Enabled') {
                        openAdminFuelScreen(
                            context, 'A-95'); //open admin screen
                      } else {
                        availabilityCheck(context, 'A-95',
                            getUserStatus); //open user screen or 'sold out' snack bar
                      }
                    },
                    label: 'A-95',
                    textColor: Colors.white,
                  ),
                  //Diesel button
                  AzsButton(
                    function: () {
                      //open screen depending mode
                      if (modeStatus == 'Enabled') {
                        openAdminFuelScreen(
                            context, 'Diesel'); //open admin screen
                      } else {
                        availabilityCheck(context, 'Diesel',
                            getUserStatus); //open user screen or 'sold out' snack bar
                      }
                    },
                    label: 'Diesel',
                    textColor: Colors.white,
                  ),
                  //Gaz button
                  AzsButton(
                    function: () {
                      //open screen depending mode
                      if (modeStatus == 'Enabled') {
                        openAdminFuelScreen(context, 'Gaz'); //open admin screen
                      } else {
                        availabilityCheck(context, 'Gaz',
                            getUserStatus); //open user screen or 'sold out' snack bar
                      }
                    },
                    label: 'Gaz',
                    textColor: Colors.white,
                  ),
                  //admin mode button
                  isAdmin
                      ? AzsButton(
                          function: changeModeStatus,
                          label: 'Change admin mode',
                          textColor: Colors.red,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
