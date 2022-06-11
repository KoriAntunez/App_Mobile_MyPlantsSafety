import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onboarding_page.dart';
import 'package:flutter_application_1/widgets/palette.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Palette.kToDark),
      home: OnBoardingPage(),
    );
  }
}
