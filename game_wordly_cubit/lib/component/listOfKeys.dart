import 'package:flip_card/flip_card_controller.dart';

List<List<FlipCardController>> mainList = List.generate(
    5, (index) => List.generate(5, (index) => FlipCardController()));
