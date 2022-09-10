import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_letape/domain/interactor/game/CreateGameInteractor.dart';
import 'package:tape_letape/domain/interactor/player/AddPlayerInteractor.dart';
import 'package:tape_letape/domain/interactor/player/EditPlayerInteractor.dart';
import 'package:tape_letape/domain/interactor/player/GetPlayerInteractor.dart';
import 'package:tape_letape/domain/model/Player.dart';

class CreatePlayerScreenCubit extends Cubit<CreatePlayerScreenState> {
  AddPlayerInteractor addPlayerInteractor;
  GetPlayerInteractor getPlayerInteractor;
  EditPlayerInteractor editPlayerInteractor;

  CreateGameInteractor createGameInteractor;

  CreatePlayerScreenCubit(this.addPlayerInteractor, this.getPlayerInteractor,
      this.editPlayerInteractor, this.createGameInteractor)
      : super(InitialState());

  void loadPlayers() {
    getPlayerInteractor.getPlayers().listen((players) {
      emit(LoadedState(players: players));
    });
  }

  void addPlayer() {
    addPlayerInteractor.addPlayer();
  }

  void changeName(String playerId, String newName) {
    editPlayerInteractor.changeName(playerId, newName);
  }

  void createGame() {
    createGameInteractor.createGame();
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
