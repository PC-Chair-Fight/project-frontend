import 'package:flutter/material.dart';

class AppBottomNavigationBar extends BottomNavigationBar {
  AppBottomNavigationBar({
    Key? key,
  }) : super(
          key: key,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Self promotions',
            ),
          ],
        );
}
