import 'package:tape_letape/domain/model/Game.dart';

class GameRepository {

  Game? _game = null;

  void createGame(Game game){
    this._game = game;
  }

  Game getGame(){
    return _game!;
  }
}