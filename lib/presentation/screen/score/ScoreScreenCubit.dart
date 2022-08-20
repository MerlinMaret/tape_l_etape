import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_letape/domain/interactor/player/GetPlayerInteractor.dart';
import 'package:tape_letape/domain/model/Player.dart';

class ScoreScreenCubit extends Cubit<ScoreScreenState> {
  GetPlayerInteractor getPlayerInteractor;

  ScoreScreenCubit(this.getPlayerInteractor) : super(InitialState());

  void loadPlayer() {
    getPlayerInteractor.getPlayers().listen((event) {
      emit(LoadedState(players: event));
    });
  }
}

class ScoreScreenState extends Equatable {
  List<Player> players;

  ScoreScreenState({required this.players});

  @override
  List<Object?> get props => [players];
}

class InitialState extends ScoreScreenState {
  InitialState() : super(players: List.empty());
}

class LoadedState extends ScoreScreenState {
  LoadedState({required List<Player> players}) : super(players: players);
}
