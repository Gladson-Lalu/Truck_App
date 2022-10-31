import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truck_app/ui/config/constants.dart';
import '../../../../../cubit/auth_cubit/auth_cubit.dart';
import '../../../../../data/model/user_model.dart';

extension Capitalize on String {
  String get inCaps =>
      '${this[0].toUpperCase()}${substring(1)}';
}

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: ((context, state) {
        if (state is AuthSuccess) {
          final UserModel user = state.user;
          return Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      NetworkImage(user.photoUrl),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(user.name.inCaps,
                    style: const TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                    underline: const SizedBox(),
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
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
                    onChanged: (value) {},
                    value: user.userType),
                const SizedBox(
                  height: 20,
                ),
                buildCard(Icons.phone, user.phoneNumber),
                const SizedBox(
                  height: 10,
                ),
                buildCard(Icons.email, user.email),
                const SizedBox(
                  height: 10,
                ),
                buildCard(Icons.location_on, user.address),
                //logout button
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    context.read<AuthCubit>().signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(
                            '/signIn', (route) => false);
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('No User Found'),
          );
        }
      }),
    );
  }

  Card buildCard(IconData icon, String value) {
    return Card(
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(value),
          ],
        ),
      ),
    );
  }
}
