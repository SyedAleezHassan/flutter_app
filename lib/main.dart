import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
///
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: calculatorApp(),
  ));
}

class calculatorApp extends StatefulWidget {
  const calculatorApp({super.key});

  @override
  State<calculatorApp> createState() => _calculatorAppState();
}

class _calculatorAppState extends State<calculatorApp> {
  //variables
  var input = '';
  var output = '';
  //var operation;
  onButtonClick(value) {
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == '=') {
      //var userInput = input;
      input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(input);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //input out wala kam
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            // color: Colors.red,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    output,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
          )),

          //buttons ka kam
          Row(
            children: [
              button(text: "AC", buttonBgColor: Colors.orange),
              button(text: "0"),
              button(text: "/"),
              button(text: "*"),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(text: "-"),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "+"),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "=", buttonBgColor: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
        child: Container(
            height: 70,
            margin: const EdgeInsets.all(6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                primary: buttonBgColor,
                padding: const EdgeInsets.all(13),
              ),
              onPressed: () => onButtonClick(text),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: tColor,
                ),
              ),
            )));
  }
}
