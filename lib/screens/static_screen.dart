import 'package:flutter/material.dart';
import 'package:gdsc_workshop/screens/high_scores.dart';
import 'package:gdsc_workshop/tictactoe.dart';

class StaticScreen extends StatelessWidget {
  const StaticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text("Tic-tac-toe!"),
      centerTitle: true,
    ),
    body: ListView(
      children: [
      const TicTacToe(),
      OutlinedButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HighScores(),
          ),
        ),
        child: const Text("View High Score"),
      ),
      ],
    ),
      
      
  );

  }
}