import 'package:equatable/equatable.dart';
import 'package:tape_letape/domain/model/Player.dart';
import 'package:tape_letape/domain/model/Round.dart';
import 'package:tape_letape/domain/model/helper/Copyable.dart';

class PlayerRound extends Equatable with Copyable<PlayerRound> {
  Player player;
  List<Round> plain;
  List<Round> mountain;
  List<Round> sprint;
  List<Round> descent;

  PlayerRound({required this.player,
    required this.plain,
    required this.mountain,
    required this.sprint,
    required this.descent});

  @override
  PlayerRound copy({ Player? player,
    List<Round>? plain,
    List<Round>? mountain,
    List<Round>? sprint,
    List<Round>? descent}) =>
      PlayerRound(player: player ?? this.player,
          plain: plain ?? this.plain,
          mountain: mountain ?? this.mountain,
          sprint: sprint ?? this.sprint,
          descent: descent ?? this.descent);

  @override
  // TODO: implement props
  List<Object?> get props => [player, plain, mountain, sprint, descent];
}
