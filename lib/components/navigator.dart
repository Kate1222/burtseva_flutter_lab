import 'package:flutter/material.dart';

void azsNavigatorPush(BuildContext context, dynamic route) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => route,
      transitionsBuilder: (_, a, __, c) =>
          FadeTransition(opacity: a, child: c),
    ),
  );
}

void azsNavigatorPushAndRemoveUntil(BuildContext context, dynamic route) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => route,
      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    ),
    (route) => false,
  );
}
