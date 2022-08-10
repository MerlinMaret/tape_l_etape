import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tape_letape/presentation/screen/MainCubit.dart';

import '../base/CubitWidget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState
    extends CubitWidgetState<MainCubit, MainState, MainScreen> {
  @override
  Widget buildWidget(BuildContext context, MainState state) {
    return Row(
      children: [
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
    );
  }

  Widget cardScoreWidget(
      String text, Function onAdd, Function onRemove, int count) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          decoration: BoxDecoration(
            border: Border.all(color: HexColor('#EEEEEE')),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 1), blurRadius: 20)
            ],
          ),
          child: Center(
            child: Text(text),
          ),
          width: 200,
          height: 300,
          margin:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        ),
        Row(
          children: [
            OutlinedButton(
                onPressed: () {
                  onRemove();
                },
                child: Text("-1")),
            Text(count.toString()),
            OutlinedButton(
                onPressed: () {
                  onRemove();
                },
                child: Text("+1")),
          ],
        )
      ],
    );
  }
}
