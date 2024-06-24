import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:interview/Constants/constants.dart';
import 'package:interview/Data%20Providers/property_data.dart';
import 'package:interview/UI/Property/property_list.dart';
import 'package:interview/Widgets/Slider/slider_widget.dart';
import 'package:slidable_button/slidable_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  String sliderText = '';
  String sliderText2 = '';

  bool isDragged = false;
  Color backgroundColor = Colors.white.withOpacity(0.8);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Opacity(
        opacity: _animation.value,
        child: Transform.translate(
          offset: Offset(0, _animation2.value),
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: gradient,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.05,
                        width: width * 0.4,
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: greyColor,
                            ),
                            Text(
                              "Saint Petersburg",
                              style: regularGreyTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/icons/profile-user.png",
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                ),
                heightSpace,
                heightSpace,
                const Text(
                  "Hi, Marina",
                  style: mediumGreyTextStyle,
                ),
                heightSpace,
                const Text(
                  "let's select your \nperfect place",
                  style: semiBoldBlackTextStyle,
                ),
                heightSpace,
                heightSpace,
                Row(
                  children: [
                    Container(
                      height: height * 0.2,
                      width: width * 0.5,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: yellowColor,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "buy".toUpperCase(),
                            style: mediumWhiteTextStyle,
                          ),
                          const Spacer(),
                          const Text(
                            "1 034",
                            style: largeBoldWhiteTextStyle,
                          ),
                          const Text(
                            "offer",
                            style: regularWhiteTextStyle,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.2,
                      width: width * 0.4,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "rent".toUpperCase(),
                            style: mediumGreyTextStyle,
                          ),
                          const Spacer(),
                          const Text(
                            "2 212",
                            style: largeBoldGreyTextStyle,
                          ),
                          const Text(
                            "offer",
                            style: regularGreyTextStyle,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                Column(
                  children: [
                    Container(
                      height: height * 0.25,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(properties[0].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Spacer(),
                          SliderWidget(
                              isDragged: isDragged,
                              backgroundColor: backgroundColor,
                              width: width,
                              text: properties[0].address),
                          // sliderWidget(width, properties[0].address),

                          heightSpace,
                        ],
                      ),
                    ),
                    heightSpace,
                    PropertyListPage(
                      isDragged: isDragged,
                      backgroundColor: backgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sliderWidget(double width, String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 45,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.5),
                color: backgroundColor,
              ),
            ),
          ),
          !isDragged
              ? Row(
                  children: [
                    // widget to be dragged
                    Draggable(
                      axis: Axis.horizontal,
                      //  the widget that actually get dragged
                      feedback: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.5),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white54,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                      // what  remains at  the origin
                      childWhenDragging: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.5),
                          color: Colors.transparent,
                        ),
                      ),
                      // use as id for draggable
                      data: "goOnlineButton",
                      // what we see  before dragging starts
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.5),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                    // text section
                    Spacer(),
                    Center(
                      child: Text(
                        "",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),

                    // destination for draggable widget
                    DragTarget(
                      builder: (context, accept, reject) {
                        return accept.isEmpty
                            ? CircleAvatar(
                                radius: 22.5,
                                backgroundColor: Colors.transparent,
                              )
                            : CircleAvatar(
                                radius: 22.5,
                                backgroundColor: Colors.black38,
                              );
                      },
                      onWillAccept: (data) {
                        if (data == "goOnlineButton") {
                          return true;
                        } else {
                          return false;
                        }
                      },
                      onAccept: (data) {
                        setState(
                          () {
                            isDragged = true;
                            backgroundColor = Colors.white.withOpacity(0.5);
                          },
                        );
                      },
                    ),
                  ],
                )
              :
              // if online show the following
              Row(
                  children: [
                    // destination widget  for the draggable widget
                    DragTarget(
                      builder: (context, accept, reject) {
                        return accept.isEmpty
                            ? CircleAvatar(
                                radius: 22.5,
                                backgroundColor: Colors.transparent,
                              )
                            : CircleAvatar(
                                radius: 22.5,
                                backgroundColor: Colors.black38,
                              );
                      },
                      onWillAccept: (data) {
                        if (data == "goOfflineButton") {
                          return true;
                        } else {
                          return false;
                        }
                      },
                      onAccept: (data) {
                        setState(
                          () {
                            isDragged = false;
                            backgroundColor = Colors.white.withOpacity(0.8);
                          },
                        );
                      },
                    ),
                    // text section
                    Spacer(),
                    Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),

                    // widget to be dragged
                    Draggable(
                      axis: Axis.horizontal,
                      //  the widget that actually get dragged
                      feedback: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.5),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white54,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                      // what  remains at  the origin
                      childWhenDragging: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.5),
                          color: Colors.transparent,
                        ),
                      ),
                      data: "goOfflineButton",
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.5),
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
