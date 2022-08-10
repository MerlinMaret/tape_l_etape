import 'package:provider/provider.dart';
import 'package:tape_letape/domain/interactor/ComputeInteractor.dart';

class InteractorProvider {
  static final providers = <Provider>[
    Provider<ScoreIteractor>(
      create: (context) => ScoreIteractor(),
    ),
  ];
}
