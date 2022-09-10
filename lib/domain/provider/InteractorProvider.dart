import 'package:provider/provider.dart';
import 'package:tape_letape/domain/interactor/game/ComputeScoreInteractor.dart';
import 'package:tape_letape/domain/interactor/game/CreateGameInteractor.dart';
import 'package:tape_letape/domain/interactor/player/EditPlayerInteractor.dart';
import 'package:tape_letape/domain/interactor/player/GetPlayerInteractor.dart';
import 'package:tape_letape/domain/interactor/player/AddPlayerInteractor.dart';
import 'package:tape_letape/domain/repository/GameRepository.dart';
import 'package:tape_letape/domain/repository/PlayerRepository.dart';

class InteractorProvider {
  static final providers = <Provider>[
    Provider<ComputeScoreIteractor>(
      create: (context) => ComputeScoreIteractor(),
    ),
    Provider<AddPlayerInteractor>(
      create: (context) => AddPlayerInteractor(context.read<PlayerRepository>()),
    ),
    Provider<EditPlayerInteractor>(
      create: (context) => EditPlayerInteractor(context.read<PlayerRepository>()),
    ),
    Provider<GetPlayerInteractor>(
      create: (context) => GetPlayerInteractor(context.read<PlayerRepository>()),
    ),
    Provider<CreateGameInteractor>(
      create: (context) => CreateGameInteractor(context.read<GameRepository>(), context.read<PlayerRepository>()),
    ),
  ];
}
