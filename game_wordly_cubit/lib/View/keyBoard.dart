import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_wordly_cubit/Controller/cubit/game_cubit.dart';
import 'package:game_wordly_cubit/component/colorKeyBoard.dart';

class KeyBoard extends StatelessWidget {
  const KeyBoard({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GameCubit.get(context);
    var size = MediaQuery.of(context).size;
    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cubit.row1
                  .map(
                    (e) => InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        cubit.putWord(e);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.006, vertical: 5),
                        alignment: Alignment.center,
                        width: size.width * 0.085,
                        height: size.width * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: colorsKeyBoard[0][cubit.row1.indexOf(e)],
                        ),
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cubit.row2
                  .map(
                    (e) => InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        cubit.putWord(e);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.006, vertical: 5),
                        alignment: Alignment.center,
                        width: size.width * 0.085,
                        height: size.width * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: colorsKeyBoard[1][cubit.row2.indexOf(e)],
                        ),
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cubit.row3
                  .map(
                    (e) => InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if (e == "ENTER") {
                          cubit.enter();
                        } else if (e == "DEL") {
                          cubit.removeLetter();
                        } else {
                          cubit.putWord(e);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.006, vertical: 5),
                        alignment: Alignment.center,
                        width: e == "ENTER"
                            ? size.width * 0.16
                            : e == "DEL"
                                ? size.width * 0.11
                                : size.width * 0.085,
                        height: size.width * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: colorsKeyBoard[2][cubit.row3.indexOf(e)],
                        ),
                        child: e == "DEL"
                            ? const Icon(Icons.backspace)
                            : Text(
                                e,
                                style: TextStyle(
                                  fontSize: e == "ENTER" ? 16 : 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
