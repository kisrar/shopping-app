import 'package:flutter/material.dart';

abstract class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    screenHeight = _mediaQueryData?.size.height;
    orientation = _mediaQueryData?.orientation;
  }
}

// Get the proportionate height as per screen size
double responsiveHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight ?? 0;
  //* Assuming that main Design height was 812
  return (inputHeight / 812.0) * screenHeight;

}

double responsiveWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth ?? 0;
  //* Assuming that main Design width was 375
  return (inputWidth / 375.0) * screenWidth;
}
