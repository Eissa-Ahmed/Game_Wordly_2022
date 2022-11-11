import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wordly_cubit/Controller/cubit/game_cubit.dart';

class GridGame extends StatelessWidget {
  const GridGame({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GameCubit.get(context);

    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          itemCount: 25,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, i) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                "",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
