import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_letape/domain/interactor/game/ComputeScoreInteractor.dart';
import 'package:tape_letape/domain/interactor/game/CreateGameInteractor.dart';
import 'package:tape_letape/domain/interactor/player/AddPlayerInteractor.dart';
import 'package:tape_letape/domain/interactor/player/EditPlayerInteractor.dart';
import 'package:tape_letape/domain/interactor/player/GetPlayerInteractor.dart';
import 'package:tape_letape/presentation/screen/player/CreatePlayerScreenCubit.dart';
import 'package:tape_letape/presentation/screen/score/ScoreScreenCubit.dart';
import 'package:tape_letape/presentation/screen/score/item/ScoreScreenItemCubit.dart';

class AppBlocProvider {
  static final providers = <BlocProvider>[
    BlocProvider<ScoreScreenItemCubit>(
      create: (context) => ScoreScreenItemCubit(
          context.read<ComputeScoreIteractor>(),
          context.read<GetPlayerInteractor>()
      ),
    ),
    BlocProvider<CreatePlayerScreenCubit>(
      create: (context) => CreatePlayerScreenCubit(
          context.read<AddPlayerInteractor>(),
          context.read<GetPlayerInteractor>(),
          context.read<EditPlayerInteractor>(),
          context.read<CreateGameInteractor>()),
    ),
    BlocProvider<ScoreScreenCubit>(
      create: (context) =>
          ScoreScreenCubit(context.read<GetPlayerInteractor>()),
    ),
  ];
}
