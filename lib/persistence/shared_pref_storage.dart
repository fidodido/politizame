import 'package:app_pcp/application/domain/model/user.dart';
import 'package:app_pcp/application/port/out/session_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefStorage implements SessionStorage {
  final String signInKey = 'SIGN_IN_KEY';

  @override
  save(User user) async {
    debugPrint('save shared prefs...');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(signInKey, true);
  }

  @override
  Future<bool> isSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isSignIn = prefs.getBool(signInKey);

    if (isSignIn == null) {
      return false;
    }

    return isSignIn;
  }
}
