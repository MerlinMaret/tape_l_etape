import 'package:flutter/cupertino.dart';
import 'package:tape_letape/presentation/base/CubitWidget.dart';
import 'package:tape_letape/presentation/screen/score/ScoreScreenCubit.dart';
import 'package:tape_letape/presentation/screen/score/item/ScoreScreenItem.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends CubitWidgetState<ScoreScreenCubit,
    ScoreScreenState, ScoreScreen> {
  @override
  void initState() {
    super.initState();
    cubit.loadPlayer();
  }

  @override
  Widget buildWidget(BuildContext context, ScoreScreenState state) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: state.players.map((player) =>
        ScoreScreenItem(playerId : player.id)
      ).toList(),
    );
  }
}
