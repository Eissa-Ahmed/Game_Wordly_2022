import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:game_wordly_cubit/component/colorGrid.dart';
import 'package:game_wordly_cubit/component/listOfKeys.dart';
import 'package:lottie/lottie.dart';

import '../../component/colorKeyBoard.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());

  static GameCubit get(context) => BlocProvider.of(context);
  //Var
  String gameGuess = "";
  int rowCell = 0;

  //List
  List<String> row1 = "QWERTYUIOP".split("");
  List<String> row2 = "ASDFGHJKL".split("");
  List<String> row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "ENTER"];
  List<String> wordGuessUser = [
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> wordGuessGame = [
    "BRING",
    "CHASE",
    "LEAVE",
    "LIMIT",
    "PEACE",
    "PANEL",
    "MAYOR",
    "MOVIE",
    "MOVIE",
    "PAINT",
    "NEEDS",
    "RADIO",
    "ROUND",
    "SCALE",
    "QUICK",
    "SHARP",
    "TAKEN",
    "TASTE",
  ];

  //Fun

  randomWord() {
    int random = Random().nextInt(wordGuessGame.length);
    gameGuess = wordGuessGame[random];
    changeColorRow();
    print(gameGuess);

    emit(ChangeWordGame());
  }

  changeColorRow() {
    for (var i = 0; i < colorsGrid[rowCell].length; i++) {
      colorsGrid[rowCell][i] = Colors.grey.shade600;
    }
    if (rowCell > 0) {
      for (var i = 0; i < colorsGrid[rowCell - 1].length; i++) {
        if (!gameGuess.contains(wordGuessUser[rowCell - 1][i])) {
          colorsGrid[rowCell - 1][i] = Colors.grey.shade800;
        }
      }
    }
    emit(ChangeColorRow());
  }

  putWord(String e) {
    if (wordGuessUser[rowCell].length < 5) {
      wordGuessUser[rowCell] += e;
    }
    emit(PutWord());
  }

  enter() {
    if (rowCell < 5) {
      if (wordGuessUser[rowCell].length == 5) {
        changeColorCell();
        changeColorKeyBoard();
        changeFlipCard();
        rowCell++;
        for (var i = 0; i < 4; i++) {
          colorsGrid[rowCell][i] = Colors.grey.shade800;
        }
      }
      changeColorRow();
      checkWinner();
      emit(EnterPutWord());
    }
    checkFail();
  }

  checkWinner() {
    for (var i in wordGuessUser) {
      if (gameGuess == i) {
        emit(FinishGame());
      }
    }
  }

  checkFail() {
    if (rowCell > 4) {
      if (gameGuess != wordGuessUser[4]) {
        emit(FinishGameFail());
      }
    }
  }

  changeColorCell() {
    for (var i = 0; i < gameGuess.length; i++) {
      if (gameGuess.contains(wordGuessUser[rowCell][i])) {
        colorsGrid[rowCell][i] = Colors.amber.shade800;
      }
      if (gameGuess[i] == wordGuessUser[rowCell][i]) {
        colorsGrid[rowCell][i] = Colors.green;
      }
    }

    emit(ChangeColorCell());
  }

  changeColorKeyBoard() {
    for (var i = 0; i < gameGuess.length; i++) {
      if (row1.contains(wordGuessUser[rowCell][i])) {
        if (gameGuess.contains(wordGuessUser[rowCell][i])) {
          colorsKeyBoard[0][row1.indexOf(wordGuessUser[rowCell][i])] =
              Colors.green;
        } else {
          colorsKeyBoard[0][row1.indexOf(wordGuessUser[rowCell][i])] =
              Colors.grey.shade700;
        }
      } else if (row2.contains(wordGuessUser[rowCell][i])) {
        if (gameGuess.contains(wordGuessUser[rowCell][i])) {
          colorsKeyBoard[1][row2.indexOf(wordGuessUser[rowCell][i])] =
              Colors.green;
        } else {
          colorsKeyBoard[1][row2.indexOf(wordGuessUser[rowCell][i])] =
              Colors.grey.shade700;
        }
      } else {
        if (gameGuess.contains(wordGuessUser[rowCell][i])) {
          colorsKeyBoard[2][row3.indexOf(wordGuessUser[rowCell][i])] =
              Colors.green;
        } else if (!gameGuess.contains(wordGuessUser[rowCell][i])) {
          colorsKeyBoard[2][row3.indexOf(wordGuessUser[rowCell][i])] =
              Colors.grey.shade700;
        }
      }
    }
    emit(ChangeColorKeyBoard());
  }

  removeLetter() {
    if (rowCell < 5) {
      if (wordGuessUser[rowCell].isNotEmpty) {
        List word = wordGuessUser[rowCell].split("");
        word.removeLast();
        wordGuessUser[rowCell] = word.join();
        emit(RemoveLetter());
      }
    }
  }

  changeFlipCard() {
    for (var i = 0; i < 5; i++) {
      mainList[rowCell][i].toggleCard();
    }
  }

  dailogWinner(BuildContext context, String image, String text) {
    showDialog(
        barrierColor: Colors.grey.shade800.withOpacity(0.7),
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Container(
              width: MediaQuery.of(context).size.width * 80,
              height: 275,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade800.withOpacity(0.7),
              ),
              child: Column(
                children: [
                  LottieBuilder.asset(
                    image,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 55),
                      backgroundColor: Colors.green.shade900,
                    ),
                    onPressed: () {
                      rowCell = 0;
                      for (var i = 0; i < 5; i++) {
                        wordGuessUser[i] = "";
                      }
                      for (var i = 0; i < 5; i++) {
                        for (var j = 0; j < 5; j++) {
                          colorsGrid[i][j] = Colors.grey.shade800;
                        }
                      }
                      for (var i = 0; i < colorsKeyBoard.length; i++) {
                        for (var j = 0; j < colorsKeyBoard[i].length; j++) {
                          colorsKeyBoard[i][j] = Colors.grey.shade300;
                        }
                      }
                      randomWord();
                      Navigator.of(context).pop();
                    },
                    child: Text(text),
                  ),
                ],
              ),
            ),
          );
        });
    Vibrate.vibrate();
  }
}
