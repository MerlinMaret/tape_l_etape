import 'package:easy_localization/easy_localization.dart';
import 'package:tape_letape/domain/repository/PlayerRepository.dart';
import 'package:uuid/uuid.dart';

import '../model/Player.dart';

class PlayerInteractor {
  PlayerRepository playerRepository;

  PlayerInteractor(this.playerRepository);

  Stream<List<Player>> getPlayers() {
    return playerRepository.getPlayers();
  }

  void addPlayer() {
    int newNumber = playerRepository.players.length + 1;
    Player player = Player(
      id: const Uuid().v1(),
      name: tr("default_player_name", namedArgs: {"no": newNumber.toString()}),
    );
    playerRepository.setPlayer(player);
  }

  void changeName(String playerId, String newName) {
    Player player = playerRepository.getPlayer(playerId);
    player.name = newName;
    playerRepository.setPlayer(player);
  }
}
