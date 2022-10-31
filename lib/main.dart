import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_app/ui/screen/splash/splash_screen.dart';
import 'cubit/payment/payment_cubit.dart';
import 'cubit/order_history/order_history_cubit.dart';
import 'data/services/auth_service.dart';
import 'data/services/firestore_service.dart';
import 'ui/screen/sign_up/sign_up_screen.dart';

import 'cubit/auth_cubit/auth_cubit.dart';
import 'ui/screen/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ui/screen/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences _prefs =
      await SharedPreferences.getInstance();
  runApp(MyApp(
    prefs: _prefs,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  MyApp({Key? key, required this.prefs}) : super(key: key);
  final FireStoreService fireStoreService =
      FireStoreService();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthCubit(
                AuthService(), fireStoreService, prefs)),
        BlocProvider(
            create: (context) =>
                OrderHistoryCubit(fireStoreService)),
        BlocProvider(
            create: (context) => PaymentCubit(
                BlocProvider.of<OrderHistoryCubit>(
                    context))),
      ],
      child: MaterialApp(
        title: 'Truck App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/signIn': (BuildContext context) =>
              SignInScreen(),
          '/signup': (BuildContext context) =>
              const SignUpScreen(),
          '/home': (BuildContext context) =>
              const HomeScreen()
        },
      ),
    );
  }
}
