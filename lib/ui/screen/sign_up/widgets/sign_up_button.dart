import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/auth_cubit/auth_cubit.dart';

class SignUpButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final String? userType;
  const SignUpButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.userType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        onPressed: BlocProvider.of<AuthCubit>(context).state
                is! AuthLoading
            ? () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    nameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty &&
                    addressController.text.isNotEmpty &&
                    userType != null &&
                    emailController.text.contains('@') &&
                    emailController.text.contains('.')) {
                  BlocProvider.of<AuthCubit>(context)
                      .signUp(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                          phoneController.text,
                          addressController.text,
                          userType!);
                } else {
                  if (!emailController.text.contains('@') ||
                      !emailController.text.contains('.')) {
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
              }
            : null,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.greenAccent,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(20)),
          ),
          elevation: 5,
        ),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacementNamed(
                  context, '/home');
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(state.message),
              ));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    )),
              );
            } else {
              return const Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              );
            }
          },
        ),
      ),
    );
  }
}
