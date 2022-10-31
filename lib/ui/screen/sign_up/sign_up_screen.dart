import 'package:flutter/material.dart';
import 'widgets/sign_up_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _phoneController =
      TextEditingController();

  final TextEditingController _addressController =
      TextEditingController();

  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.fromLTRB(15, 110, 0, 0),
              child: const Text(
                "Signup",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 35, left: 20, right: 30),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    decoration: const InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType:
                        TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: const InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    decoration: const InputDecoration(
                        labelText: 'PHONE NUMBER',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType:
                        TextInputType.streetAddress,
                    controller: _addressController,
                    decoration: const InputDecoration(
                        labelText: 'ADDRESS',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(
                        child: Text('Truck Owner'),
                        value: 'Truck Owner',
                      ),
                      DropdownMenuItem(
                        child: Text('Load Owner'),
                        value: 'Load Owner',
                      ),
                      DropdownMenuItem(
                        child: Text('Broker'),
                        value: 'Broker',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value;
                      });
                    },
                    hint: const Text("SELECT USER TYPE"),
                    value: _selectedType,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat'),
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType:
                        TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green),
                        )),
                  ),
                  const SizedBox(height: 5.0),
                  const SizedBox(
                    height: 40,
                  ),
                  SignUpButton(
                      emailController: _emailController,
                      passwordController:
                          _passwordController,
                      nameController: _nameController,
                      phoneController: _phoneController,
                      addressController: _addressController,
                      userType: _selectedType),
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
      ),
    );
  }
}
