import 'package:flutter/material.dart';
import 'package:interview/Constants/constants.dart';
import 'package:interview/Data%20Providers/property_data.dart';
import 'package:interview/Widgets/Slider/slider_widget.dart';
import 'package:slidable_button/slidable_button.dart';

class PropertyListPage extends StatefulWidget {
  PropertyListPage({
    super.key,
    required this.isDragged,
    required this.backgroundColor,
  });
  bool isDragged;
  Color backgroundColor;

  @override
  State<PropertyListPage> createState() => _PropertyListPageState();
}

class _PropertyListPageState extends State<PropertyListPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: properties.length - 1,
          itemBuilder: (context, index) {
            final property = properties[index + 1];
            return Container(
              height: height * 0.2,
              width: width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(property.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  SliderWidget(
                      isDragged: widget.isDragged,
                      backgroundColor: widget.backgroundColor,
                      width: width,
                      text: property.address),
                  heightSpace,
                ],
              ),
            );
          }),
    );
  }
}
