import 'package:provider/provider.dart';
import 'package:tape_letape/domain/interactor/ComputeInteractor.dart';
import 'package:tape_letape/domain/interactor/PlayerInteractor.dart';
import 'package:tape_letape/domain/repository/PlayerRepository.dart';

class InteractorProvider {
  static final providers = <Provider>[
    Provider<ScoreIteractor>(
      create: (context) => ScoreIteractor(),
    ),
    Provider<PlayerInteractor>(
      create: (context) => PlayerInteractor(context.read<PlayerRepository>()),
    ),
  ];
}
