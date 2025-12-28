

import 'package:flutter/material.dart';

import 'splashscreen.dart';

void main() {
  runApp(const AnimalSoundsApp());
}

class AnimalSoundsApp extends StatelessWidget {
  const AnimalSoundsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: SplashScreen()
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => HomePage(),
      //   "/info": (context) {
      //     final animal =
      //         ModalRoute.of(context)!.settings.arguments as Animalsmodel;

      //     return Info(animals: animal);
      //   },
      // },
    );
  }
}
