part of 'game_cubit.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class ChangeWordGame extends GameState {}

class PutWord extends GameState {}

class EnterPutWord extends GameState {}

class RemoveLetter extends GameState {}

class ChangeColorCell extends GameState {}

class FinishGame extends GameState {}

class FinishGameFail extends GameState {}

class ChangeColorKeyBoard extends GameState {}
