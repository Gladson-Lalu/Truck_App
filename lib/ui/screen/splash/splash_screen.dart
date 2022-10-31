import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../cubit/auth_cubit/auth_cubit.dart';
import '../../config/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      BlocProvider.of<AuthCubit>(context)
          .checkIfUserIsLoggedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText(
                  'TrUTrack',
                  textStyle: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  )),
                  speed: const Duration(milliseconds: 80),
                ),
              ], isRepeatingAnimation: false),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
                width: 20,
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.pushReplacementNamed(
                          context, '/home');
                    } else if (state is AuthFailure) {
                      Navigator.pushReplacementNamed(
                          context, '/signIn');
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return CircularProgressIndicator(
                        color: kPrimaryColor,
                        strokeWidth: 2,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
