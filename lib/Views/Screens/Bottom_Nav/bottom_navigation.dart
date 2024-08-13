import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freshfold_app/Utils/Constants.dart';
import 'package:freshfold_app/Views/Screens/Customer_Screen/My%20Account/account.dart';

import '../Customer_Screen/Home/home.dart';
import '../Customer_Screen/My_Orders/my_orders.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({super.key});

  @override
  _bottomNavState createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  late PageController _pageController;

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  List<Widget> _children = [];

  @override
  void initState() {
    _pageController = PageController();
    _children = [
      HomePage(),
      MyOrdersScreen(),
      MyAccountScreen(),
      // Search(),
      // const Chat(),

      // Wallet(),
      // MiningTeam(),
      // Support(),
    ];

    // TODO: implement initState
    //re appear statusbar in case it was not there in the previous page
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _children,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          // color: ColorConstants.backgroundColor1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CustomNavigationBar(
          elevation: 5,
          borderRadius: const Radius.circular(10),
          currentIndex: _currentIndex,
          unSelectedColor: Colors.grey,
          selectedColor: ColorConstants.backgroundColor2,
          onTap: _onItemTapped,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: const Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(
                Icons.offline_pin_rounded,
              ),
              title: const Text(
                "Orders",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(
                Icons.person,
              ),
              title: const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
