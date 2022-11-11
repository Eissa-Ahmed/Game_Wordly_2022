import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wordly_cubit/View/gridGame2.dart';
import 'package:game_wordly_cubit/View/keyBoard.dart';

import '../Controller/cubit/game_cubit.dart';

class HomeGame extends StatelessWidget {
  const HomeGame({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GameCubit.get(context);

    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {
        if (state is FinishGame) {
          Future.delayed(
            const Duration(milliseconds: 500),
            () => cubit.dailogWinner(
                context, "assets/images/winner.json", "NEXT"),
          );
        }
        if (state is FinishGameFail) {
          Future.delayed(
            const Duration(milliseconds: 500),
            () =>
                cubit.dailogWinner(context, "assets/images/loss.json", "AGAIN"),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff212121),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Expanded(
                  flex: 6,
                  child: GridGame2(),
                ),
                Expanded(
                  flex: 3,
                  child: KeyBoard(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
