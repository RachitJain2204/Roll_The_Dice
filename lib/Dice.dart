import 'dart:math';
import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  var number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo,
              Colors.lightBlue,
              Color.fromARGB(255, 62, 243, 62)
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/dice-$number.png"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 5,
                          color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.transparent,

                  ),
                  onPressed: () {
                    setState(() {
                      number = Random().nextInt(6) + 1;
                    });
                  },
                  child: Text(
                    "Roll The Dice",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}