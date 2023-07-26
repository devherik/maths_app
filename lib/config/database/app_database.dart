library globals;

import 'package:flutter/widgets.dart';
import 'package:maths_app/features/log/domain/entities/user_entity.dart';

class Database extends ValueNotifier<List<UserEntity>> {
  Database() : super(<UserEntity>[]);

  dynamic globalUser;

  addUser(user) => value.add(user);
  UserEntity getUser(name) {
    globalUser = value.firstWhere((u) => u.name == name || u.email == name);
    return globalUser;
  }

  UserEntity newUser(name, email, password) {
    var u = UserEntity(email: email, password: password, name: name);
    value.add(u);
    globalUser = u;
    return u;
  }

  removeUser(name) => value.remove(Database().getUser(name));
}
