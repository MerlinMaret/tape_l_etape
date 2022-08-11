import 'package:equatable/equatable.dart';

class Score extends Equatable {
  int bigCardCount;
  int smallCardCount;

  Score(this.bigCardCount, this.smallCardCount);

  @override
  // TODO: implement props
  List<Object?> get props => [bigCardCount, smallCardCount];
}
