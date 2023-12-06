import 'package:burtseva_flutter_lab/functions/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void azsBuyFuel(BuildContext context, String title, int countFuel,
    int buyFuelValue, int userCountBonuses, int userSelectCountBonuses) {
  if (buyFuelValue == 0) {
    snackBar(context, 'Select count fuel!');
  }
  else {
    FirebaseFirestore.instance
        .collection('fuels')
        .doc(title)
        .update({'count': countFuel - buyFuelValue}); //update count fuel

    userCountBonuses -= userSelectCountBonuses;

    if (buyFuelValue >= 15) {
      userCountBonuses += buyFuelValue - 14;
    }

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'bonuses': userCountBonuses}); //update user bonuses count

    Navigator.pop(context); //back to previous screen

    snackBar(context, 'Successful sold!');
  }
}
