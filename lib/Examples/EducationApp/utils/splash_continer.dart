import 'package:flutter/material.dart';

Widget customContainer(
  double height,
  BorderRadius radius,
  Color color,
) {
  return Container(
    height: height,
      decoration:  BoxDecoration(
        borderRadius: radius,
        color: color,
      ),
  );
}



