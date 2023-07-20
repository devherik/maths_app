import 'package:flutter/widgets.dart';
import 'package:maths_app/features/auth/login/domain/entities/user_entity.dart';

class Database extends ValueNotifier<List<UserEntity>> {
  Database() : super(<UserEntity>[]);

  addUser(user) => value.add(user);
  UserEntity getUser(name) {
    return value.firstWhere((u) => u.nickname == name || u.email == name);
  }

  UserEntity newUser(nick, email, password) {
    var u = UserEntity(email: email, password: password, nickname: nick);
    value.add(u);
    return u;
  }

  removeUser(name) => value.remove(Database().getUser(name));
}
