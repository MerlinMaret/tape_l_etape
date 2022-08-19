import 'dart:async';

import 'package:tape_letape/domain/model/Player.dart';

class PlayerRepository{

  StreamController<List<Player>> _playersStream = StreamController.broadcast();
  List<Player> players = List.empty(growable: true);

  void setPlayer(Player player) {
    if(!players.contains(player)){
      players.add(player);
    }
    _playersStream.sink.add(players);
  }

  Player getPlayer(String playerId){
    return players.firstWhere((element) => element.id == playerId);
  }

  Stream<List<Player>> getPlayers(){
    return _playersStream.stream;
  }
}