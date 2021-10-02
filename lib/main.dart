import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text("Double Dice"),
          backgroundColor: Colors.red,
        ),
        body: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDiceNumber = 2;
  int rightDiceNumber = 2;

  changeDiceNumberState() {
    leftDiceNumber = getRandomNumber(6);
    rightDiceNumber = getRandomNumber(6);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  // Map myNumbers = changeSides();
                  // leftDiceNumber = myNumbers['left'];
                  // rightDiceNumber = myNumbers['right'];
                  // simple solution is
                  // generate left and right dice number here like given below:
                  //leftDiceNumber = getRandomNumber(6);
                  //rightDiceNumber = getRandomNumber(6);
                  changeDiceNumberState();
                });
              },
              child: Image.asset("images/d$leftDiceNumber.png"),
            ),
          ),
          Expanded(
            child: TextButton(
              child: Image.asset("images/d$rightDiceNumber.png"),
              onPressed: () {
                setState(() {
                  Map myNumbers = changeSides();
                  leftDiceNumber = myNumbers['left'];
                  rightDiceNumber = myNumbers['right'];
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

Map<String, int> changeSides() {
  Map<String, int> numbers = {};
  numbers = ({'left': getRandomNumber(6), 'right': getRandomNumber(6)});
  return numbers;
}

int getRandomNumber(int total) {
  return Random().nextInt(total) + 1;
}
