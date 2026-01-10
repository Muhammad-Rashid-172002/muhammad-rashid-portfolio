import 'package:flutter/material.dart';
import 'package:rashid_codes/AboutMePage.dart' ;
import 'package:rashid_codes/PortfolioPage.dart';
import 'package:rashid_codes/Resume_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ResumePage()
    );
  }
}
