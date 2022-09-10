import 'package:tape_letape/domain/model/Player.dart';

import '../../repository/PlayerRepository.dart';

class EditPlayerInteractor {

  PlayerRepository playerRepository;

  EditPlayerInteractor(this.playerRepository);

  void changeName(String playerId, String newName) async {
    Player player = await playerRepository.getPlayer(playerId);
    player.name = newName;
    playerRepository.setPlayer(player);
  }
}