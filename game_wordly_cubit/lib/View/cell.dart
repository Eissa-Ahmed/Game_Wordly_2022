import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  Cell(this.color, this.letter, {super.key});
  Color color;
  String letter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DottedBorder(
        strokeWidth: 3,
        color: color.withOpacity(0.6),
        radius: const Radius.circular(4),
        dashPattern: const [6, 3],
        padding: const EdgeInsets.all(0.8),
        borderType: BorderType.RRect,
        child: Container(
          width: 65,
          height: 70,
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
        ),
      ),
    );
  }
}
