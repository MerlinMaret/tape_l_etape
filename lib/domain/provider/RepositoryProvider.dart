import 'package:provider/provider.dart';
import 'package:tape_letape/domain/repository/PlayerRepository.dart';

class RepositoryProvider{
  static final providers = <Provider>[
    Provider<PlayerRepository>(
      create: (context) => PlayerRepository(),
    ),
  ];
}