import 'package:fit_track/authentication_wrapper.dart';
import 'package:fit_track/login_page.dart';
import 'package:fit_track/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff242f3f),
        appBar: AppBar(
          title: Text('Profile', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Color(0xff27243f),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: FutureBuilder<User>(
          future: fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading user data'));
            } else {
              User user = snapshot.data!;
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.0),
                    Container(
                        alignment: Alignment.center,
                        width:250,
                        height:250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white60,
                        ),
                        child: Icon(
                            Icons.person,
                            size: 200,
                            color: Colors.white,
                        ),
                    ),
                    SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: nameController,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          labelText: 'Current name: ${user.name}',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          labelText: 'Current email: ${user.email}',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          saveUserData();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.yellow,
                          fixedSize: const Size(
                              300,50
                          ),
                        ),
                        child: Text("Edit Data"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('isLoggedIn', false);
                          setState(() {});
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => loginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          fixedSize: const Size(
                              300,50
                          ),
                        ),
                        child: Text("Sign Out"),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
    );
  }

  Future<User> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? 'Unknown';
    String email = prefs.getString('email') ?? 'Unknown';
    return User(name: name, email: email);
  }
  Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User data saved')),
    );
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}