import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/services/auth_service.dart';
import 'ui/screen/sign_up/sign_up_screen.dart';

import 'cubit/auth_cubit/auth_cubit.dart';
import 'ui/screen/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ui/screen/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthCubit(AuthService())),
      ],
      child: MaterialApp(
        title: 'Truck App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignInScreen(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) =>
              SignupScreen(),
          '/home': (BuildContext context) =>
              const HomeScreen()
        },
      ),
    );
  }
}
