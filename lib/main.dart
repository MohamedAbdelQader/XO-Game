import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_o_game/login%20screen.dart';

import 'home.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName:(_)=>Home(),
        LoginScreen.routeName:(_)=>LoginScreen(),
      },
      home: LoginScreen(),
    );
  }
}
