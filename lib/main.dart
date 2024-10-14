import 'package:api_pusing/screen/HomePage.dart';
import 'package:api_pusing/screen/api3.dart';
import 'package:api_pusing/screen/api4.dart';
import 'package:flutter/material.dart';
import 'package:api_pusing/screen/api2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
 home: PageAPi3(),
    );
  }
}
