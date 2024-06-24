import 'package:flutter/material.dart';

// Colors
const Color blackColor = Color(0xFF232220);
const Color greyColor = Color(0xFFA5957E);
const Color yellowColor = Color(0xFFF4A231);
const Color backgroundColor1 = Color(0xFFE7DED0);
const Color backgroundColor2 = Color(0xFFD3B380);
const Color backgroundColor3 = Color(0xFFF3F1EE);
const Color whiteColor = Colors.white;

// background Gradient
const LinearGradient gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    backgroundColor3,
    backgroundColor1,
    backgroundColor1,
    backgroundColor1,
    backgroundColor2,
  ],
);

// height
const SizedBox heightSpace = SizedBox(height: 10);
const SizedBox height5Space = SizedBox(height: 10);

//width
const SizedBox widthSpace = SizedBox(width: 10);
const SizedBox width5Space = SizedBox(width: 5);

// Grey textstyle
const TextStyle smallGreyTextStyle = TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.normal,
  color: greyColor,
);
const TextStyle regularGreyTextStyle = TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.normal,
  color: greyColor,
);
const TextStyle mediumGreyTextStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.normal,
  color: greyColor,
);
const TextStyle semiBoldGreyTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  color: greyColor,
);
const TextStyle mediumBoldGreyTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: greyColor,
);
const TextStyle largeGreyTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.normal,
  color: greyColor,
);
const TextStyle largeBoldGreyTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: greyColor,
);

// Black textstyle
const TextStyle smallBlackTextStyle = TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.normal,
  color: blackColor,
);
const TextStyle regularBlackTextStyle = TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.normal,
  color: whiteColor,
);
const TextStyle mediumBlackTextStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.normal,
  color: blackColor,
);
const TextStyle mediumBoldBlackTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: blackColor,
);
const TextStyle semiBoldBlackTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w500,
  color: blackColor,
);
const TextStyle largeBlackTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.normal,
  color: blackColor,
);
const TextStyle largeBoldBlackTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: blackColor,
);

// white textstyle
const TextStyle smallWhiteTextStyle = TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.normal,
  color: whiteColor,
);

const TextStyle regularWhiteTextStyle = TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.normal,
  color: whiteColor,
);

const TextStyle mediumBoldWhiteTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: whiteColor,
);
const TextStyle mediumWhiteTextStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.normal,
  color: whiteColor,
);
const TextStyle semiBoldWhiteTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.w500,
  color: whiteColor,
);
const TextStyle largeWiteTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.normal,
  color: whiteColor,
);
const TextStyle largeBoldWhiteTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: whiteColor,
);
