import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tape_letape/domain/interactor/ComputeInteractor.dart';
import 'package:tape_letape/presentation/screen/MainCubit.dart';

class AppBlocProvider {
  static final providers = <BlocProvider>[
    BlocProvider<MainCubit>(
      create: (context) =>
          MainCubit(context.read<ScoreIteractor>()),
    ),
  ];
}
