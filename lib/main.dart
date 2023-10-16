import 'package:burtseva_flutter_lab/screens/sign_in_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gas Station',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        /*body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong!'));
            }
            else if (snapshot.hasData) {
              return const HomeScreen();
            }
            else {
              return const SignInBuilder();
            }
          },
        ),*/
        body: SignInBuilder(),
      ),
    );
  }
}
