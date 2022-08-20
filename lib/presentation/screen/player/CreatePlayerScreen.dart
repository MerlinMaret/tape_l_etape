import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tape_letape/presentation/Navigation.dart';
import 'package:tape_letape/presentation/base/CubitWidget.dart';
import 'package:tape_letape/presentation/component/Button.dart';

import 'CreatePlayerScreenCubit.dart';

class CreatePlayerScreen extends StatefulWidget {
  const CreatePlayerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreatePlayerScreenState();
}

class _CreatePlayerScreenState extends CubitWidgetState<CreatePlayerScreenCubit,
    CreatePlayerScreenState, CreatePlayerScreen> {
  @override
  void initState() {
    super.initState();
    cubit.loadPlayers();
  }

  @override
  Widget buildWidget(BuildContext context, CreatePlayerScreenState state) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Column(
                children: state.players
                    .map((player) => TextField(
                          controller: TextEditingController()
                            ..text = player.name,
                          onChanged: (text) =>
                              {cubit.changeName(player.id, text)},
                        ))
                    .toList(),
              ),
              PrimaryButton(
                  onPressed: () {
                    cubit.addPlayer();
                  },
                  title: tr("add_player")),
              PrimaryButton(
                  onPressed: () {
                    Navigation.pushRoute(context, Navigation.score);
                  },
                  title: tr("play"))
            ],
          )
        ],
      ),
    );
  }
}
