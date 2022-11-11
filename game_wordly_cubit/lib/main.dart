import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wordly_cubit/View/homeGame.dart';

import 'Controller/cubit/game_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit()..randomWord(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeGame(),
      ),
    );
  }
}
