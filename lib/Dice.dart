import 'dart:math';
import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  var number = 1;

  static const double baseWidth = 393;
  static const double baseHeight = 873;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final widthScale = size.width / baseWidth;
    final heightScale = size.height / baseHeight;

    // Use min to avoid distortion
    final scale = min(widthScale, heightScale);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo,
              Colors.lightBlue,
              Color.fromARGB(255, 62, 243, 62),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: Image.asset(
                  "assets/dice-$number.png",
                  width: 200 * scale,
                ),
              ),
              SizedBox(height: 10 * scale),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10 * scale),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(20 * scale),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 5 * scale,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10 * scale),
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
                        fontSize: 40 * scale,
                      ),
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