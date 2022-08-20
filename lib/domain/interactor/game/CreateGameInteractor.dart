import 'package:tape_letape/domain/model/Game.dart';
import 'package:tape_letape/domain/model/Player.dart';
import 'package:tape_letape/domain/model/PlayerRound.dart';
import 'package:tape_letape/domain/repository/GameRepository.dart';
import 'package:tape_letape/domain/repository/PlayerRepository.dart';

class CreateGameInteractor {

  GameRepository gameRepository;
  PlayerRepository playerRepository;


  CreateGameInteractor(this.gameRepository, this.playerRepository);

  void createGame() async {
    List<Player> players = await playerRepository.getPlayers();
    List<PlayerRound> playerRound = players.map((player) =>
        PlayerRound(
            player: player,
            plain: List.empty(),
            mountain: List.empty(),
            sprint: List.empty(),
            descent: List.empty()
        )
    ).toList();
    gameRepository.createGame(
        Game(playerRounds: playerRound)
    );
  }
}