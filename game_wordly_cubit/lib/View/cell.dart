import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  Cell(this.color, this.letter, {super.key});
  Color color;
  String letter;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 70,
      margin: const EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
