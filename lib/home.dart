import 'package:flutter/material.dart';
import 'package:x_o_game/reUsable%20Component/board%20button.dart';
class Home extends StatefulWidget {
  static const String routeName="Home";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String guess="مين هيكسب؟🔥";
  int scorePlayerOne=0;
  int scorePlayerTwo=0;
  List<String> boardState=[
    "","","",
    "","","",
    "","",""
  ];

  @override
  Widget build(BuildContext context) {
    HomeArgs args=ModalRoute.of(context)!.settings.arguments as HomeArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text("XO Game",style: TextStyle(color: Colors.white,fontSize: 34),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text(guess,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${args.player1} (X)",style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("Score : $scorePlayerOne",style: TextStyle(
                    fontSize: 25,
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("${args.player2} (O)",style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("Score : $scorePlayerTwo",style: TextStyle(
                      fontSize: 25,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              BoardButton(symbol: boardState[0],buttonClick: play,position: 0,),
              BoardButton(symbol: boardState[1],buttonClick: play,position: 1,),
              BoardButton(symbol: boardState[2],buttonClick: play,position: 2),

            ],),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              BoardButton(symbol: boardState[3],buttonClick: play,position: 3),
              BoardButton(symbol: boardState[4],buttonClick: play,position: 4),
              BoardButton(symbol: boardState[5],buttonClick: play,position: 5),

            ],),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              BoardButton(symbol: boardState[6],buttonClick: play,position: 6),
              BoardButton(symbol: boardState[7],buttonClick: play,position: 7),
              BoardButton(symbol: boardState[8],buttonClick: play,position: 8),

            ],),
          ),
        ],
      ),

    );
  }
  int counter =1;
  void play(int position){
    if (boardState[position].isNotEmpty){
      return;
    }
    setState(() {
      print(counter);
      if(counter%2!=0){
        boardState[position]="X";
        guess="جامد 💪";

      }else{
        boardState[position]="O";
        guess="عاش  👏";

      }
      if(checkWinner("X")){
        counter=0;
        scorePlayerOne+=1;
        resetGame();
      }else if(checkWinner("O")){
        counter=0;
        scorePlayerTwo+=1;
        resetGame();
      }else if(counter==9){
        counter=0;
        resetGame();
      }else{
        counter++;
      }

    });
  }
  void resetGame(){
    boardState=[
      "","","",
      "","","",
      "","",""
    ];
  }
  bool checkWinner(String symbol){
    for (int i=0 ; i<9;i+=3){
      if(boardState[i]== symbol &&
          boardState[i+1]== symbol &&
          boardState[i+2]== symbol ){
        return true;
      }
    }
    for (int i=0 ; i<3;i++){
      if(boardState[i]== symbol &&
          boardState[i+3]== symbol &&
          boardState[i+6]== symbol ){
        return true;
      }
      if(boardState[0]==symbol&&
          boardState[4]==symbol&&
          boardState[8]==symbol){
        return true;
      }
      if(boardState[2]==symbol&&
          boardState[4]==symbol&&
          boardState[6]==symbol){
        return true;
      }
    }
    return false;


  }
}
class HomeArgs{
  String player1;
  String player2;
  HomeArgs(this.player1,this.player2);
}
