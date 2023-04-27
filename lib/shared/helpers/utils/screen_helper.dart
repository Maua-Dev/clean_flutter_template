import 'package:flutter/material.dart';

class ScreenHelper {
  static Size size(BuildContext context) => MediaQuery.of(context).size;
  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) => size(context).height;
  static const breakpointMobile = 600;
  static const breakpointTablet = 1000;
}
