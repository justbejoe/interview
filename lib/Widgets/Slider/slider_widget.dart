import 'package:flutter/material.dart';
import 'package:interview/Constants/constants.dart';

class SliderWidget extends StatefulWidget {
  SliderWidget({
    super.key,
    required this.isDragged,
    required this.backgroundColor,
    required this.width,
    required this.text,
  });
  bool isDragged;
  Color backgroundColor;
  double width;
  String text;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 45,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.5),
                color: widget.backgroundColor,
              ),
            ),
          ),
          !widget.isDragged
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
                          gradient: const LinearGradient(
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
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                    // text section
                    const Spacer(),
                    const Center(
                      child: Text(
                        "",
                      ),
                    ),
                    const Spacer(),

                    // destination for draggable widget
                    DragTarget(
                      builder: (context, accept, reject) {
                        return accept.isEmpty
                            ? const CircleAvatar(
                                radius: 22.5,
                                backgroundColor: Colors.transparent,
                              )
                            : const CircleAvatar(
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
                            widget.isDragged = true;
                            widget.backgroundColor =
                                Colors.white.withOpacity(0.5);
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
                            ? const CircleAvatar(
                                radius: 22.5,
                                backgroundColor: Colors.transparent,
                              )
                            : const CircleAvatar(
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
                            widget.isDragged = false;
                            widget.backgroundColor =
                                Colors.white.withOpacity(0.8);
                          },
                        );
                      },
                    ),
                    // text section
                    const Spacer(),
                    Center(
                      child: Text(
                        widget.text,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Spacer(),

                    // widget to be dragged
                    Draggable(
                      axis: Axis.horizontal,
                      //  the widget that actually get dragged
                      feedback: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.5),
                          gradient: const LinearGradient(
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
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                            ],
                          ),
                        ),
                        child: const Center(
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
