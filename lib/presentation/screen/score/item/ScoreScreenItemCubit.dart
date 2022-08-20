import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_letape/domain/interactor/game/ComputeScoreInteractor.dart';
import 'package:tape_letape/domain/interactor/player/GetPlayerInteractor.dart';
import 'package:tape_letape/domain/model/Player.dart';
import 'package:tape_letape/domain/model/Score.dart';

class ScoreScreenItemCubit extends Cubit<ScoreScreenItemState> {
  ComputeScoreIteractor scoreIteractor;
  GetPlayerInteractor getPlayerInteractor;

  ScoreScreenItemCubit(this.scoreIteractor, this.getPlayerInteractor)
      : super(InitialState());

  void loadPlayer(String playerId) async {
    Player? player = await getPlayerInteractor.getPlayer(playerId);
    emit(LoadedState(score: state.score, computedScore: state.computedScore, player: player));
  }

  int computeScore(Score score) {
    return scoreIteractor.computeScore(score);
  }

  void addBigCard() {
    Score newScore = scoreIteractor.addBigCard(state.score);
    emit(
      LoadedState(
          score: newScore,
          computedScore: computeScore(newScore),
          player: state.player),
    );
  }

  void removeBigCard() {
    Score newScore = scoreIteractor.removeBigCard(state.score);
    emit(
      LoadedState(
          score: newScore,
          computedScore: computeScore(newScore),
          player: state.player),
    );
  }

  void addSmallCard() {
    Score newScore = scoreIteractor.addSmallCard(state.score);
    emit(
      LoadedState(
          score: newScore,
          computedScore: computeScore(newScore),
          player: state.player),
    );
  }

  void removeSmallCard() {
    Score newScore = scoreIteractor.removeSmallCard(state.score);
    emit(
      LoadedState(
          score: newScore,
          computedScore: computeScore(newScore),
          player: state.player),
    );
  }
}

abstract class ScoreScreenItemState extends Equatable {
  Score score;
  int computedScore;
  Player? player;

  ScoreScreenItemState(
      {required this.score, required this.computedScore, required this.player});

  @override
  List<Object?> get props => [score, computedScore,player];
}

class InitialState extends ScoreScreenItemState {
  InitialState()
      : super(
          score: Score(smallCardCount: 0, bigCardCount: 0),
          computedScore: 0,
          player: null,
        );
}

class LoadedState extends ScoreScreenItemState {
  LoadedState(
      {required Score score, required int computedScore, required Player? player})
      : super(score: score, computedScore: computedScore, player: player);
}
