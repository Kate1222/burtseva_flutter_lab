import 'package:burtseva_flutter_lab/components/navigator.dart';
import 'package:burtseva_flutter_lab/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void azsLogout(BuildContext context) {
  //logout user account
  FirebaseAuth.instance.signOut();
  azsNavigatorPushAndRemoveUntil(context, const LoginScreen());
}

void azsRemoveAccount(BuildContext context) async {
  //remove user info from database
  final userId = FirebaseAuth.instance.currentUser!.uid;
  await FirebaseFirestore.instance.collection('users').doc(userId).delete();
  //remove user account
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    user?.delete();
  });
  // ignore: use_build_context_synchronously
  azsNavigatorPushAndRemoveUntil(context, const LoginScreen());
}
