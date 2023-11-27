import 'package:burtseva_flutter_lab/screens/fuel_admin_screen.dart';
import 'package:burtseva_flutter_lab/screens/fuel_screen.dart';
import 'package:burtseva_flutter_lab/screens/settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  //open user screen function or show snack bar
  void availabilityCheck(String fuelName) async {
    //get fuel data
    final dataFuel = await FirebaseFirestore.instance
        .collection('fuels')
        .doc(fuelName)
        .get();

    //check fuel count
    if (dataFuel['count'] == 0) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sold out!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    //open user buy screen
    else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => FuelScreen(title: fuelName),
          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
        ),
      ).then((value) => getUserStatus());
    }
  }

  //open Admin screen function
  void openAdminFuelScreen(String fuelName) async {
    //get fuel data
    final dataFuel = await FirebaseFirestore.instance
        .collection('fuels')
        .doc(fuelName)
        .get();

    //navigate to admin screen
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => FuelAdminScreen(title: fuelName, data: dataFuel),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      ),
    );
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
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  /*MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),*/
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const SettingsScreen(),
                    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                  ),
                );
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: IconButton(
                      onPressed: () {
                        //open screen depending mode
                        if (modeStatus == 'Enabled') {
                          openAdminFuelScreen('A-92'); //open admin screen
                        } else {
                          availabilityCheck('A-92'); //open user screen or 'sold out' snack bar
                        }
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'A-92',
                            style: GoogleFonts.raleway(
                                fontSize: 32, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //A-95 button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: IconButton(
                      onPressed: () {
                        //open screen depending mode
                        if (modeStatus == 'Enabled') {
                          openAdminFuelScreen('A-95'); //open admin screen
                        } else {
                          availabilityCheck('A-95'); //open user screen or 'sold out' snack bar
                        }
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'A-95',
                            style: GoogleFonts.raleway(
                                fontSize: 32, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Diesel button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: IconButton(
                      onPressed: () {
                        //open screen depending mode
                        if (modeStatus == 'Enabled') {
                          openAdminFuelScreen('Diesel'); //open admin screen
                        } else {
                          availabilityCheck('Diesel'); //open user screen or 'sold out' snack bar
                        }
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Diesel',
                            style: GoogleFonts.raleway(
                                fontSize: 32, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Gaz button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: IconButton(
                      onPressed: () {
                        //open screen depending mode
                        if (modeStatus == 'Enabled') {
                          openAdminFuelScreen('Gaz'); //open admin screen
                        } else {
                          availabilityCheck('Gaz'); //open user screen or 'sold out' snack bar
                        }
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Gaz',
                            style: GoogleFonts.raleway(
                                fontSize: 32, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //admin mode button
                  isAdmin
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: IconButton(
                            onPressed: changeModeStatus,
                            icon: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Colors.white,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Change admin mode',
                                  style: GoogleFonts.raleway(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
