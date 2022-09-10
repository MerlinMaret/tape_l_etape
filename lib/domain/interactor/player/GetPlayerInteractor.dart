import 'package:rxdart/subjects.dart';
import 'package:tape_letape/domain/model/Player.dart';
import 'package:tape_letape/domain/repository/PlayerRepository.dart';

class GetPlayerInteractor{
  PlayerRepository playerRepository;

  GetPlayerInteractor(this.playerRepository);

  Stream<List<Player>> getPlayers() {
    return playerRepository.getPlayersObservable();
  }

  Future<Player> getPlayer(String playerId) {
    return playerRepository.getPlayer(playerId);
  }
}