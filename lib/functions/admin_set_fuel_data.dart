import 'package:burtseva_flutter_lab/functions/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void adminSetFuelData(BuildContext context, String title, int newFuelCount, double newCost, int newLimit) {
  FirebaseFirestore.instance
      .collection('fuels')
      .doc(title)
      .update({'count': newFuelCount}); //update count fuel
  FirebaseFirestore.instance
      .collection('fuels')
      .doc(title)
      .update({'cost': newCost}); //update cost fuel
  FirebaseFirestore.instance
      .collection('fuels')
      .doc(title)
      .update({'limit': newLimit}); //update buy limit fuel
  Navigator.pop(context); //back to previous screen

  snackBar(context, 'Successful changed!');
}