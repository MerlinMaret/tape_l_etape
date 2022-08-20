import 'dart:async';

import 'package:rxdart/subjects.dart';
import 'package:tape_letape/domain/model/Player.dart';

class PlayerRepository {
  final BehaviorSubject<List<Player>> _playersSubject = BehaviorSubject.seeded(List.empty(growable: true));

  void setPlayer(Player player) async {
    List<Player> _players = _playersSubject.value;
    if (!_players.contains(player)) {
      _players.add(player);
    }
    _playersSubject.add(_players);
  }

  Future<Player> getPlayer(String playerId) async {
    List<Player> players = await getPlayers();
    return players.firstWhere((element) => element.id == playerId);
  }

  Future<List<Player>> getPlayers() async {
    return _playersSubject.value;
  }

  Stream<List<Player>> getPlayersObservable() {
    return _playersSubject;
  }
}
