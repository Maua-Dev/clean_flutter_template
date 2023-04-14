import 'package:flutter/material.dart';

class ScreenHelper {
  static Size size(BuildContext c) => MediaQuery.of(c).size;
  static double width(BuildContext c) => size(c).width;
  static double height(BuildContext c) => size(c).height;
  static const breakpointMobile = 600;
  static const breakpointTablet = 1000;
}
