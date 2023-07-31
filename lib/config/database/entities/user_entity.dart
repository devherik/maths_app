import 'package:flutter/material.dart';
import 'package:maths_app/config/database/entities/cubicmeter_entity.dart';
import 'package:maths_app/config/database/entities/squaremeter_entity.dart';

class UserEntity {
  final String? name;
  final String? email;
  final String? password;
  ValueNotifier<List<CubicMeter>> cubics$ = ValueNotifier([]);
  ValueNotifier<List<SquareMeter>> squares$ = ValueNotifier([]);

  UserEntity({required this.email, required this.password, required this.name});

  dynamic getName() => name;
  dynamic getEmail() => email;

  List getSquare() => squares$.value;
  addSquare(SquareMeter s) => squares$.value.add(s);
  removeSquare(SquareMeter s) => squares$.value.remove(s);

  List getCubic() => cubics$.value;
  addCubic(CubicMeter c) => cubics$.value.add(c);
  removeCubic(CubicMeter c) => cubics$.value.remove(c);
}
