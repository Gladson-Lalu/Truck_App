import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  void _signIn(BuildContext context) async {
    try {
      final User? user =
          (await _auth.signInWithEmailAndPassword(
                  email: _emailController.text.trim(),
                  password: _passwordController.text))
              .user;
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration Successful"),
          ),
        );
        Navigator.of(context).pushNamed('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Registration Failed"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().split(']')[1]),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(
                    15, 110, 0, 0),
                child: const Text(
                  "TrUTrack",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 35, left: 20, right: 30),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  keyboardType:
                      TextInputType.visiblePassword,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green),
                      )),
                ),
                const SizedBox(height: 5.0),
                Container(
                  alignment: const Alignment(1, 0),
                  padding: const EdgeInsets.only(
                      top: 15, left: 20),
                  child: const InkWell(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          decoration:
                              TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_emailController
                              .text.isNotEmpty &&
                          _passwordController
                              .text.isNotEmpty &&
                          _emailController.text
                              .contains('@') &&
                          _emailController.text
                              .contains('.')) {
                        _signIn(context);
                      } else {
                        if (!_emailController.text
                                .contains('@') ||
                            !_emailController.text
                                .contains('.')) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                                      'Please enter a valid email address')));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                'Please fill in all the fields'),
                          ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.greenAccent,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)),
                      ),
                      elevation: 5,
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('/signup');
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration:
                                TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
