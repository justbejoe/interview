import 'package:flutter/material.dart';
import 'package:interview/Constants/constants.dart';
import 'package:interview/UI/chat_page.dart';
import 'package:interview/UI/favorite_page.dart';
import 'package:interview/UI/homepage.dart';
import 'package:interview/UI/profile_page.dart';
import 'package:interview/UI/search_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _currentIndex = 2;
  List<Widget> pages = [
    const SearchPage(),
    const ChatPage(),
    const HomePage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            pages.elementAt(_currentIndex),
            Positioned(
              bottom: height * 0.05,
              left: width * 0.15,
              child: bottomNavBar(height, width),
            ),
          ],
        ),
        //  bottomNavigationBar: bottomNavBar(height, width),
      ),
    );
  }

  Widget bottomNavBar(double height, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        width: width * 0.7,
        height: height * 0.095,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: yellowColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => _changeTab(index),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.search,
                ),
              ),
              label: "Search",
              activeIcon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Center(
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Image.asset(
                  "assets/icons/chat.png",
                  height: height * 0.04,
                  color: Colors.grey,
                ),
              ),
              label: "Chat",
              activeIcon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icons/chat.png",
                    height: height * 0.03,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/home.png",
                height: height * 0.03,
                color: Colors.grey,
              ),
              label: "Home",
              activeIcon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icons/home.png",
                    height: height * 0.03,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              label: "Favorite",
              activeIcon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/profile-user.png",
                height: height * 0.03,
                color: Colors.grey,
              ),
              label: "Profile",
              activeIcon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icons/profile-user.png",
                    height: height * 0.03,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
