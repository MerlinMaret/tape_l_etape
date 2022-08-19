import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_letape/domain/interactor/PlayerInteractor.dart';
import 'package:tape_letape/domain/model/Player.dart';

class CreatePlayerScreenCubit extends Cubit<CreatePlayerScreenState> {
  PlayerInteractor playerInteractor;

  CreatePlayerScreenCubit(this.playerInteractor) : super(InitialState());

  void loadPlayers() {
    playerInteractor.getPlayers().listen((players) {
      emit(LoadedState(players: players));
    });
  }

  void addPlayer() {
    playerInteractor.addPlayer();
  }

  void changeName(String playerId, String newName) {
    playerInteractor.changeName(playerId,newName);
  }
}

class CreatePlayerScreenState extends Equatable {
  String id;
  List<Player> players;

  CreatePlayerScreenState({required this.id, required this.players});

  @override
  List<Object?> get props => [id];
}

class InitialState extends CreatePlayerScreenState {
  InitialState() : super(id: "", players: List.empty());
}

class LoadedState extends CreatePlayerScreenState {
  LoadedState({required List<Player> players})
      : super(id: players.map((e) => e.id).toString(), players: players);
}
