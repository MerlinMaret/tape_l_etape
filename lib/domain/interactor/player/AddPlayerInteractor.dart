import 'package:easy_localization/easy_localization.dart';
import 'package:tape_letape/domain/model/Player.dart';
import 'package:tape_letape/domain/repository/PlayerRepository.dart';
import 'package:uuid/uuid.dart';

class AddPlayerInteractor {
  PlayerRepository playerRepository;

  AddPlayerInteractor(this.playerRepository);

  void addPlayer() async {
    List<Player> players = await playerRepository.getPlayers();
    int newNumber = players.length + 1;
    Player player = Player(
      id: const Uuid().v1(),
      name: tr("default_player_name", namedArgs: {"no": newNumber.toString()}),
    );
    playerRepository.setPlayer(player);
  }
}
