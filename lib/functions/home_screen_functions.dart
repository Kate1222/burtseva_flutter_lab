import 'package:burtseva_flutter_lab/components/navigator.dart';
import 'package:burtseva_flutter_lab/functions/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/fuel_admin_screen.dart';
import '../screens/fuel_screen.dart';

void availabilityCheck(BuildContext context, String fuelName, dynamic getUserStatus) async {
  //get fuel data
  final dataFuel = await FirebaseFirestore.instance
      .collection('fuels')
      .doc(fuelName)
      .get();

  //check fuel count
  if (dataFuel['count'] == 0) {
    // ignore: use_build_context_synchronously
    snackBar(context, 'Sold out!');
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
    ).then((value) => getUserStatus);
  }
}

//open Admin screen function
void openAdminFuelScreen(BuildContext context, String fuelName) async {
  //get fuel data
  final dataFuel = await FirebaseFirestore.instance
      .collection('fuels')
      .doc(fuelName)
      .get();

  //navigate to admin screen
  // ignore: use_build_context_synchronously
  azsNavigatorPush(context, FuelAdminScreen(title: fuelName, data: dataFuel));
}

void changeUserStatus() async {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final data = await FirebaseFirestore.instance.collection('users').doc(userId).get();
  String adminStatus = data['admin'];
  if (adminStatus == 'true') {
    adminStatus = 'false';
  }
  else {
    adminStatus = 'true';
  }
  FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .update({'admin': adminStatus});
}