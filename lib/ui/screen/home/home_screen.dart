import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fragments/profile_fragment/profile_fragment.dart';
import '../../../cubit/order_history/order_history_cubit.dart';
import 'fragments/booking_history_fragment/booking_history_fragment.dart';
import 'fragments/home_fragment/home_fragment.dart';
import '../../config/constants.dart';
import '../../config/data.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<NavigationItem> navigationItems =
      getNavigationItemList();
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeFragment(),
    const Center(
        child: Text('Search',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold))),
    const OrderHistoryFragment(),
    const ProfileFragment(),
  ];
  @override
  void initState() {
    BlocProvider.of<OrderHistoryCubit>(context)
        .getOrderHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "TrUTracK",
          style: GoogleFonts.acme(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 28,
            ),
          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navigationItems
            .map((item) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex =
                          navigationItems.indexOf(item);
                    });
                  },
                  child: SizedBox(
                    width: 50,
                    child: Stack(
                      children: [
                        _selectedIndex ==
                                navigationItems
                                    .indexOf(item)
                            ? Center(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        kPrimaryColorShadow,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        Center(
                          child: Icon(
                            item.iconData,
                            color: _selectedIndex ==
                                    navigationItems
                                        .indexOf(item)
                                ? kPrimaryColor
                                : Colors.grey[400],
                            size: 24,
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
