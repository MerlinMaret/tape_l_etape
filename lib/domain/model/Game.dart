import 'package:equatable/equatable.dart';

import 'PlayerRound.dart';
import 'helper/Copyable.dart';

class Game extends Equatable with Copyable<Game> {
  List<PlayerRound> playerRounds;

  Game({required this.playerRounds});

  @override
  Game copy({List<PlayerRound>? playerRounds}) =>
      Game(playerRounds: playerRounds ?? this.playerRounds);

  @override
  // TODO: implement props
  List<Object?> get props => [playerRounds];
}
