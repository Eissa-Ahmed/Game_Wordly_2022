import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wordly_cubit/Controller/cubit/game_cubit.dart';
import 'package:game_wordly_cubit/View/cell.dart';
import 'package:game_wordly_cubit/component/colorGrid.dart';
import 'package:game_wordly_cubit/component/listOfKeys.dart';

class GridGame2 extends StatelessWidget {
  const GridGame2({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GameCubit.get(context);

    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              5,
              (i) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    5,
                    (j) => FlipCard(
                      direction: FlipDirection.VERTICAL,
                      flipOnTouch: false,
                      controller: mainList[i][j],
                      front: Cell(
                        colorsGrid[i][j],
                        cubit.wordGuessUser[i].length > j
                            ? cubit.wordGuessUser[i][j]
                            : "",
                      ),
                      back: Cell(
                        colorsGrid[i][j],
                        cubit.wordGuessUser[i].length > j
                            ? cubit.wordGuessUser[i][j]
                            : "",
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
