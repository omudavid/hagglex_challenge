import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dashboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoard(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        // selectedItemColor: activeColor,
        // unselectedItemColor: inactiveColor,
        elevation: 0,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/dasbboard.svg',
              //color: _currentIndex == 0 ? activeColor : inactiveColor,
            ),
            label: '',
            //backgroundColor: activeColor,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/wallet.svg',
              // color: _currentIndex == 1 ? activeColor : inactiveColor,
            ),
            label: '',
            // backgroundColor: activeColor
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/otc.svg',
              //color:
              // _currentIndex == 2 ? activeColor : inactiveColor,
            ),
            label: '',
            // backgroundColor: activeColor
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/cyptosave.svg',
              // color:
              // _currentIndex == 3 ? activeColor : inactiveColor,
            ),
            label: '',
            // backgroundColor: activeColor
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/more.svg',
              // color:
              // _currentIndex == 3 ? activeColor : inactiveColor,
            ),
            label: '',
            // backgroundColor: activeColor
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
