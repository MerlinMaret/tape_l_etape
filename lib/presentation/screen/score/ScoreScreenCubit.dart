import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_letape/domain/model/Score.dart';

import '../../../domain/interactor/ComputeInteractor.dart';

class ScoreScreenCubit extends Cubit<ScoreScreenState> {
  ScoreIteractor scoreIteractor;

  ScoreScreenCubit(this.scoreIteractor) : super(InitialState());

  int computeScore(Score score) {
    return scoreIteractor.computeScore(score);
  }

  void addBigCard() {
    Score newScore = scoreIteractor.addBigCard(state.score);
    emit(
      ScoreScreenState(newScore, computeScore(newScore)),
    );
  }

  void removeBigCard() {
    Score newScore = scoreIteractor.removeBigCard(state.score);
    emit(
      ScoreScreenState(newScore, computeScore(newScore)),
    );
  }

  void addSmallCard() {
    Score newScore = scoreIteractor.addSmallCard(state.score);
    emit(
      ScoreScreenState(newScore, computeScore(newScore)),
    );
  }

  void removeSmallCard() {
    Score newScore = scoreIteractor.removeSmallCard(state.score);
    emit(
      ScoreScreenState(newScore, computeScore(newScore)),
    );
  }
}

class ScoreScreenState extends Equatable {
  Score score;
  int computedScore;

  ScoreScreenState(this.score, this.computedScore);

  @override
  List<Object?> get props => [score, computedScore];
}

class InitialState extends ScoreScreenState {
  InitialState() : super(Score(smallCardCount: 0, bigCardCount: 0), 0);
}
