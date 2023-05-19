import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hack Speed Meter',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primarySwatch: Colors.green,
      ),
      home: const HomeView(),
    );
  }
}
