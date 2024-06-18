import 'package:fit_track/diet_page.dart';
import 'package:fit_track/home.dart';
import 'package:fit_track/login_page.dart';
import 'package:fit_track/profile_page.dart';
import 'package:fit_track/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:fit_track/bmi_calculator.dart';

import 'authentication_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FitTrack",
      initialRoute: '/',
      routes: {
        '/': (context) => AuthenticationWrapper(),
        '/home': (context) => MainApp(),
        '/signup': (context) => signUpPage(),
      },
    );
  }
}
class MainApp extends StatefulWidget {
  MainApp({Key? key}): super(key : key);

  @override
  _MainApp createState() => _MainApp();

}

class _MainApp extends State<MainApp> {
  var _currentPage = 0;
  final _pages = [
    Home(),
    DietPage(),
    BMICalculator(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "FitTrack",
        home: Scaffold(
          backgroundColor: Color(0xff242f3f),
          body: Center(child: _pages.elementAt(_currentPage)),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.grey,
              items: const[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.restaurant),
                    label: 'Diet'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calculate),
                    label: 'BMI calculator'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile'
                ),
              ],
            currentIndex: _currentPage,
            fixedColor: Colors.yellow,
            onTap: (int inIndex){
                setState(() {
                  _currentPage = inIndex;
                });
            },
          ),
        ),
    );
  }
}