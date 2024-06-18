import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signUpPage extends StatelessWidget {
  signUpPage({Key? key}) : super(key:key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff242f3f),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: RichText(
                  text: TextSpan(
                    children:[
                      TextSpan(
                        text: 'Fit',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 32,
                        ),
                      ),
                      TextSpan(
                        text: 'Track',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                  ),
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person_add, color: Colors.grey),
                            label: Text('Name', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff242f3f),
                            ),)
                        ),
                        controller: nameController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.mail_outline, color: Colors.grey),
                            label: Text('Email', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff242f3f),
                            ),)
                        ),
                        controller: emailController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                            label: Text('Password', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff242f3f),
                            ),)
                        ),
                        controller: passwordController,
                      ),
                      SizedBox(height: 70),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            String email = emailController.text;
                            String password = passwordController.text;
                            String name = nameController.text;

                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString('email', email);
                            await prefs.setString('password', password);
                            await prefs.setString('name', name);
                            Navigator.pushReplacementNamed(context, '/');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xff3f3434),
                            fixedSize: const Size(
                                400,50
                            ),
                          ),
                          child: Text("Register account"),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }


}