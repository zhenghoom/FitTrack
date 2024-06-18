import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fit_track/home.dart';
import 'package:fit_track/login_page.dart';

import 'main.dart';

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {});
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? MainApp() : loginPage();

  }
}
