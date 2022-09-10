import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tape_letape/presentation/base/CubitWidget.dart';
import 'package:tape_letape/presentation/helper/TimeHelper.dart';
import 'package:tape_letape/presentation/screen/score/item/ScoreScreenItemCubit.dart';


class ScoreScreenItem extends StatefulWidget {

  String playerId;

  ScoreScreenItem({required this.playerId}) : super(key: Key(playerId));

  @override
  State<StatefulWidget> createState() => _ScoreScreenItemState();
}

class _ScoreScreenItemState extends CubitWidgetState<ScoreScreenItemCubit,
    ScoreScreenItemState, ScoreScreenItem> {

  @override
  void initState() {
    super.initState();
    cubit.loadPlayer(widget.playerId);
  }

  @override
  ScoreScreenItemCubit getCubitEntity(){
    return ScoreScreenItemCubit(context.read(),context.read());
  }

  @override
  Widget buildWidget(BuildContext context, ScoreScreenItemState state) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: HexColor('#EEEEEE')),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(0, 1), blurRadius: 20)
        ],
      ),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(state.player?.name ?? ""),
              cardScoreWidget("+10", () {
                cubit.addSmallCard();
              }, () {
                cubit.removeSmallCard();
              }, state.score.smallCardCount),
              cardScoreWidget("+30", () {
                cubit.addBigCard();
              }, () {
                cubit.removeBigCard();
              }, state.score.bigCardCount),
            ],
          ),
          Text(TimeHelper.secondsToMinutesString(state.computedScore))
        ],
      ),
    );
  }

  Widget cardScoreWidget(
      String text, VoidCallback onAdd, VoidCallback onRemove, int count) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          decoration: BoxDecoration(
            border: Border.all(color: HexColor('#EEEEEE')),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 1), blurRadius: 20)
            ],
          ),
          width: 200,
          height: 300,
          margin:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child: Center(
            child: Text(text),
          ),
        ),
        Row(
          children: [
            OutlinedButton(onPressed: onRemove, child: const Text("-1")),
            Text(count.toString()),
            OutlinedButton(onPressed: onAdd, child: const Text("+1")),
          ],
        )
      ],
    );
  }
}
