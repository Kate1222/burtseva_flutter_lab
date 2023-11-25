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
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              })
        ],
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const FuelScreen(title: 'A-92'),
                          ),
                        );
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const FuelScreen(title: 'A-95'),
                          ),
                        );
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const FuelScreen(title: 'Diesel'),
                          ),
                        );
                      },
                      icon: Container(
                        //height: 45,
                        //width: screenWidth - 76,
                        //margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const FuelScreen(title: 'Gaz'),
                          ),
                        );
                      },
                      icon: Container(
                        //height: 45,
                        //width: screenWidth - 76,
                        //margin: const EdgeInsets.only(top: 40, left: 38, right: 38),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Calculator',
                            style: GoogleFonts.raleway(
                                fontSize: 32, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
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
