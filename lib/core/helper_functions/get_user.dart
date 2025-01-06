import 'dart:convert';

import 'package:fruits_hub/core/services/shared_preferences_singletone.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

import '../../constants.dart';

UserEntity getUser() {
  var getUserDataJson = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(getUserDataJson));
  return userEntity;
}
