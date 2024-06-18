import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginPage extends StatelessWidget {
  loginPage({Key? key}) : super(key:key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                      text: 'Login',
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
                        suffixIcon: Icon(Icons.mail_outline, color: Colors.grey),
                        label: Text('Email', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff242f3f),
                        ),)
                      ),
                      controller: email,
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
                      controller: password,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 70),
                    Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            String emailData = prefs.getString('email') ?? '';
                            String passwordData = prefs.getString('password') ?? '';

                            if(email.text == emailData && password.text == passwordData){
                              prefs.setBool('isLoggedIn', true);
                              Navigator.pushReplacementNamed(context, '/home');
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Invalid credentials')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xff3f3434),
                            fixedSize: const Size(
                              400,50
                            ),
                          ),
                          child: Text("Sign In"),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "Register account",
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
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