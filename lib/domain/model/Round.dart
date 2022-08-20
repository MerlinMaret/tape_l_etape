import 'package:equatable/equatable.dart';
import 'package:tape_letape/domain/model/Player.dart';
import 'package:tape_letape/domain/model/Score.dart';
import 'package:tape_letape/domain/model/helper/Copyable.dart';

class Round extends Equatable with Copyable<Round> {
  Player player;
  Score score;

  Round({required this.player, required this.score});

  @override
  Round copy({Player? player, Score? score}) =>
      Round(player: player ?? this.player, score: score ?? this.score);

  @override
  List<Object?> get props => [player, score];
}
