import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  void _register(BuildContext context) async {
    try {
      final User? user =
          (await _auth.createUserWithEmailAndPassword(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(
                    15, 110, 0, 0),
                child: const Text(
                  "Signup",
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
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType:
                      TextInputType.visiblePassword,
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
                        _register(context);
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
                        'Signup',
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
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration:
                            TextDecoration.underline),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
