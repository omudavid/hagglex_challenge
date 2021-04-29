import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagglex/bloc/sign_in_cubit.dart';
import 'package:hagglex/user_interface/screens/home.dart';
import 'package:hagglex/user_interface/screens/log_in_screen.dart';
import 'package:hagglex/user_interface/screens/search_Country.dart';
import 'package:hagglex/user_interface/screens/setup_completed_screen.dart';
import 'package:hagglex/user_interface/screens/sign_up_screen.dart';
import 'package:hagglex/user_interface/screens/splash_screen.dart';
import 'package:hagglex/user_interface/screens/verify_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'BGP'),
      home: FutureBuilder(
          future: Future.delayed(Duration(seconds: 5)),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            }
            return LogInScreen();
          }),

      // VerifyScreen(),
    );
  }
}
