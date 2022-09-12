import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'neu_button.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String questions = '';
  String answers = '';

  void pressedButton(String button){
    //when you press clear
    if (button == buttons[0]){
      setState(() {
        questions = '';
        answers = '';
      });
    }

    //when you press delete
    else if (button == buttons[1]){
      setState(() {
        questions = questions.substring(0,questions.length-1);
      });
    }
    //when you press equals
    else if (button == '='){
      calculateExpression();
    }
    //when you press the rest of the buttons
    else {
      setState(() {
        questions = questions + button;
      });
    }
  }

  void calculateExpression(){
  String finalQuestion;

  finalQuestion = questions;

    Parser p = Parser();
    Expression expression = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, cm);

    setState(() {
      answers = eval.toString();
    });
  }

  final List buttons = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(questions, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(answers, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35
                      ),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex:2,child: Container(child: Container(
            padding: EdgeInsets.all(8),
            child: GridView.builder(
              itemCount: buttons.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4),
              itemBuilder: (context, index) {if (index == 0) {return NeuButtons(child: buttons[index],
                  buttonColor: Colors.deepPurple[300],
                  textColor: Colors.green, function: (){pressedButton(buttons[index]);},);}
              else if (index == 2 || index==3 || index == 7 || index == 11 || index == 15 || index == 19){return NeuButtons(child: buttons[index], buttonColor: Colors.deepPurple[300], textColor: Colors.white, function: (){pressedButton(buttons[index]);},);}
              else if (index == 1){return NeuButtons(child: buttons[index], buttonColor: Colors.deepPurple[300], textColor: Colors.red, function: (){pressedButton(buttons[index]);},);}
              else {return NeuButtons(child:buttons[index], buttonColor: Colors.deepPurple[300],textColor: Colors.black, function: (){pressedButton(buttons[index]);}, );};}
            ),
          ),),),
        ],
      ),
    );
  }
}
