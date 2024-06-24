import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:interview/Constants/constants.dart';
import 'package:interview/Constants/map_json.dart';
import 'package:interview/Data%20Providers/property_data.dart';
import 'package:interview/UI/map_page.dart';
import 'package:interview/Widgets/Map/custom_marker.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey _buttonKey = GlobalKey();

  late PageController pageController;

  @override
  void initState() {
    id = 4;

    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.4);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Builder(builder: (context) {
            return SizedBox(
              height: height,
              width: width,
              child: MapPage(id: id),
            );
          }),
          Positioned(
            top: 20,
            left: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Search bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  height: 50,
                  width: width * 0.6,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: blackColor,
                        ),
                        hintText: "Saint Petersburg",
                      ),
                      onChanged: (value) {},
                      onSubmitted: (value) {},
                    ),
                  ),
                ),
                widthSpace,
                // Filter button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: width * 0.15,
                    decoration: const BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/icons/horizontal.png",
                        height: 20,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // to toggle map between dark and light mood
          // Positioned(
          //   top: 16.0,
          //   right: 16.0,
          //   child: _nightModeToggler(),
          // ),

          // marker filter options
          Positioned(
            bottom: 230.0,
            left: 16.0,
            child: Builder(builder: (context) {
              return Container(
                height: 50,
                width: width * 0.15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ElevatedButton(
                  key: _buttonKey,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    _showPopupMenu(context);
                  },
                  child: Image.asset(
                    image,
                    height: 25,
                    color: Colors.grey.shade400,
                  ),
                ),
              );
            }),
          ),

          // navigation
          Positioned(
            bottom: 170.0,
            left: 16.0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: width * 0.15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {},
                  child: Image.asset(
                    "assets/icons/gps-navigation.png",
                    height: 20,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ),

          // List of variants
          Positioned(
            bottom: 180.0,
            right: 16.0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                height: 50,
                width: width * 0.4,
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/side-menu.png",
                        height: 20,
                        color: Colors.grey.shade400,
                      ),
                      width5Space,
                      Text(
                        "List of variants",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String image = "assets/icons/layers.png";
  int id = 0;
  void _showPopupMenu(BuildContext context) {
    final RenderBox buttonRenderBox =
        _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final buttonPosition = buttonRenderBox.localToGlobal(Offset.zero);

    final popupMenuItems = <PopupMenuEntry>[
      PopupMenuItem(
        height: 10,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            "assets/icons/security.png",
            height: 20,
          ),
          title: const Text('Cozy Area'),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              image = "assets/icons/security.png";
              id = 1;
            });
          },
        ),
      ),
      PopupMenuItem(
        height: 10,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            "assets/icons/wallet.png",
            height: 20,
          ),
          title: const Text('Price'),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              image = "assets/icons/wallet.png";
              id = 2;
            });
          },
        ),
      ),
      PopupMenuItem(
        height: 10,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            "assets/icons/delete.png",
            height: 20,
          ),
          title: const Text('Infrastructure'),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              image = "assets/icons/delete.png";
              id = 3;
            });
          },
        ),
      ),
      PopupMenuItem(
        height: 10,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            "assets/icons/layers.png",
            height: 20,
          ),
          title: const Text('Without any layer'),
          onTap: () {
            Navigator.pop(context);
            setState(() {
              image = "assets/icons/layers.png";
              id = 4;
            });
          },
        ),
      ),
    ];

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy,
        MediaQuery.of(context).size.width -
            buttonPosition.dx -
            buttonRenderBox.size.width,
        MediaQuery.of(context).size.height -
            buttonPosition.dy -
            buttonRenderBox.size.height,
      ),
      items: popupMenuItems,
      elevation: 8.0,
    );
  }
}
/**
 cozy area 
 price 
 infrastructure
 without any layer
 */
