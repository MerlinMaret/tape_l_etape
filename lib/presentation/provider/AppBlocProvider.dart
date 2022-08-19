import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_letape/domain/interactor/ComputeInteractor.dart';
import 'package:tape_letape/domain/interactor/PlayerInteractor.dart';
import 'package:tape_letape/presentation/screen/player/CreatePlayerScreenCubit.dart';
import 'package:tape_letape/presentation/screen/score/ScoreScreenCubit.dart';

class AppBlocProvider {
  static final providers = <BlocProvider>[
    BlocProvider<ScoreScreenCubit>(
      create: (context) =>
          ScoreScreenCubit(context.read<ScoreIteractor>()),
    ),
    BlocProvider<CreatePlayerScreenCubit>(
      create: (context) =>
          CreatePlayerScreenCubit(context.read<PlayerInteractor>()),
    ),
  ];
}
