import 'package:equatable/equatable.dart';
import 'package:tape_letape/domain/model/helper/Copyable.dart';

class Score extends Equatable with Copyable<Score> {
  int bigCardCount;
  int smallCardCount;

  Score({required this.bigCardCount, required this.smallCardCount});

  @override
  List<Object?> get props => [bigCardCount, smallCardCount];

  @override
  Score copy({int? bigCardCount, int? smallCardCount}) => Score(
        bigCardCount: bigCardCount ?? this.bigCardCount,
        smallCardCount: smallCardCount ?? this.smallCardCount,
      );
}
