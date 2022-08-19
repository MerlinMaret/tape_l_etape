import 'package:equatable/equatable.dart';

import 'helper/Copyable.dart';

class Player extends Equatable with Copyable<Player> {

  String id;
  String name;

  Player({required this.id, required this.name});

  @override
  copy({String? id, String? name}) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
