import 'package:flutter/material.dart';
import 'package:x_o_game/home.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName="login";

  TextEditingController player1Controller=TextEditingController();
  TextEditingController player2Controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XO Game",style: TextStyle(color: Colors.white,fontSize: 34),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: player1Controller,
              decoration: InputDecoration(
                labelText: "Player 1 Name"
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: player2Controller,
              decoration: InputDecoration(
                  labelText: "Player 2 Name"
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, Home.routeName,arguments: HomeArgs(player1Controller.text, player2Controller.text));

            }, child: Text("Play"))
          ],
        ),
      ),

    );
  }
}
