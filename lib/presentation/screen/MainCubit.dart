import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_letape/domain/model/Score.dart';

import '../../domain/interactor/ComputeInteractor.dart';

class MainCubit extends Cubit<MainState> {
  ScoreIteractor scoreIteractor;

  MainCubit(this.scoreIteractor) : super(InitialState());

  int computeScore(Score score) {
    return scoreIteractor.computeScore(state.score);
  }

  void addBigCard(){
    Score newScore = scoreIteractor.addBigCard(state.score);
    emit(
      MainState(
        newScore,
        computeScore(newScore)
      ),
    );
  }

  void removeBigCard(){
    Score newScore = scoreIteractor.removeBigCard(state.score);
    emit(
      MainState(
          newScore,
          computeScore(newScore)
      ),
    );
  }

  void addSmallCard(){
    Score newScore = scoreIteractor.addSmallCard(state.score);
    emit(
      MainState(
          newScore,
          computeScore(newScore)
      ),
    );
  }

  void removeSmallCard(){
    Score newScore = scoreIteractor.removeSmallCard(state.score);
    emit(
      MainState(
          newScore,
          computeScore(newScore)
      ),
    );
  }

}

class MainState extends Equatable {

  Score score;
  int computedScore;

  MainState(this.score, this.computedScore);

  @override
  List<Object?> get props =>
      [
        score,
        computedScore
      ];
}

class InitialState extends MainState {
  InitialState() : super(
    Score(0, 0),
    0
  );
}
