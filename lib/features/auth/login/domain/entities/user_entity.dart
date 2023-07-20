import 'package:flutter/material.dart';
import 'package:maths_app/features/auth/login/domain/entities/cubicmeter_entity.dart';
import 'package:maths_app/features/auth/login/domain/entities/squaremeter_entity.dart';

class UserEntity {
  final int? id;
  final String? nickname;
  final String? email;
  final String? password;
  ValueNotifier<List<CubicMeter>> cubics$ = ValueNotifier([]);
  ValueNotifier<List<SquareMeter>> squares$ = ValueNotifier([]);

  UserEntity(this.id,
      {required this.email, required this.password, required this.nickname});

  dynamic getNick() => nickname;
  dynamic getEmail() => email;
  dynamic getId() => id;

  List getSquare() => squares$.value;
  addSquare(SquareMeter s) => squares$.value.add(s);
  removeSquare(SquareMeter s) => squares$.value.remove(s);

  List getCubic() => cubics$.value;
  addCubic(CubicMeter c) => cubics$.value.add(c);
  removeCubic(CubicMeter c) => cubics$.value.remove(c);
}
