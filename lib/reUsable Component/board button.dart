import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef onButtonClick=void Function(int);

class BoardButton extends StatelessWidget {
   String symbol;
   onButtonClick buttonClick;
   int position;
   BoardButton({super.key,required this.symbol,required this.buttonClick,required this.position});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero
              )
            ),
              onPressed: () {
              buttonClick(position);
              }, child: Text(symbol,
            style: TextStyle(
            fontSize: 55,
            color: (symbol=="X")?Colors.purple:Colors.red,
          ),)),
        ));
  }
}
