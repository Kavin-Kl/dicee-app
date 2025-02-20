import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  @override
  final AudioPlayer audioPlayer = AudioPlayer();
  int ld = 1;
  int rd = 1;

  void rollDice() async {
    setState(() {
      ld = 1 + Random().nextInt(6);
      rd = 1 + Random().nextInt(6);
    });
    await audioPlayer.play(AssetSource('audios/dice_roll.mp3'));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 27, 38),
      appBar: AppBar(
        title: const Text('Roll Your Chances'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: rollDice,
              child: Image.asset(
                'images/dice$ld.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: rollDice,
              child: Image.asset(
                'images/dice$rd.png',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
