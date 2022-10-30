import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/auth_button.dart';

import '../../../cubit/auth_cubit/auth_cubit.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();
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
              children: [
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
                      labelText: 'PASSWORD',
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
                AuthButton(
                    onPressed: (() {
                      BlocProvider.of<AuthCubit>(context)
                          .signIn(_emailController.text,
                              _passwordController.text);
                    }),
                    text: "Sign In",
                    emailController: _emailController,
                    passwordController:
                        _passwordController),
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
