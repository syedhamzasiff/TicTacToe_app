import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<bool?> board = [];
  bool currentTurn = true;
  
  
  @override
  void initState(){
    for(int i = 0; i < 9; i++){
      board.add(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 3),
      children: [
        TableRow(children: [
          TableCell(child: slot(0)),
          TableCell(child: slot(1)),
          TableCell(child: slot(2)),
        ]),
        TableRow(children: [
          TableCell(child: slot(3)),
          TableCell(child: slot(4)),
          TableCell(child: slot(5)),
        ]),
        TableRow(children: [
          TableCell(child: slot(6)),
          TableCell(child: slot(7)),
          TableCell(child: slot(8)),
        ]),
      ],
    );
  }
    bool hasWonGame(bool turn) {
    const List<List<int>> winningCombos = [
      // horizontal
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      // vertical
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      // diagonal
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (int i = 0; i < winningCombos.length; i++) {
      List<int> check = winningCombos[i];
      if (board[check[0]] == turn &&
          board[check[1]] == turn &&
          board[check[2]] == turn) {
        return true;
      }
    }
    return false;
  }
  tie() {
    for (int i = 0; i < 9; i++) {
      if (board[i] == null) {
        return false;
      }
    }
    return true;
  }

  void evaluateGame() async {
  if (hasWonGame(currentTurn)) {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Congratulations!"),
        content: Text(
            "${currentTurn ? "The Queen" : "Snow"} has won the game!"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (int i = 0; i < 9; i++) {
                  board[i] = null;
                }
              });
              Navigator.of(context).pop();
            },
            child: const Text("PLAY AGAIN"),
          ),
        ],
      ),
    );
  } else if (tie()) {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Tie"),
        content: const Text(":("),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                for (int i = 0; i < 9; i++) {
                  board[i] = null;
                }
              });
              Navigator.of(context).pop();
            },
            child: const Text("PLAY AGAIN"),
          ),
        ],
      ),
    );
  } else {
    setState(() {
      currentTurn = !currentTurn;
    });
    }
  }
  Widget slot(int i) {
    return InkWell(
      onTap: () {
        if(board[i] != null){
          return;
        }
        setState(() {
          board[i] = currentTurn;
        });
        return evaluateGame();
      },
      child: board[i] == null
            ? const SizedBox(
              height: 150,
            )
            : Image.asset(
              board[i] == true
              ? 'assets/dragon queen.jfif'
              : 'assets/john snow.jfif' ,
              height: 150,
            ),
    );
  }
}



        