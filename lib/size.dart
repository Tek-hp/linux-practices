import 'package:flutter/material.dart';

getHeight(double height, BuildContext context) {
  return (height / 1920) * MediaQuery.of(context).size.height;
}

getWidth(double width, BuildContext context) {
  return (width / 1080) * MediaQuery.of(context).size.width;
}
