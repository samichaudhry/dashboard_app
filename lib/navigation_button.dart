import 'package:flutter/material.dart';

Widget navigationButton(icon, onPressedFunc, isActive) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
      color: isActive ? const Color(0xFFfedd69) : const Color(0xFFf2f6fe),
      shape: BoxShape.circle,
    ),
    child: IconButton(
        onPressed: onPressedFunc,
        icon:
            Icon(icon, size: 20, color: isActive ? Colors.black : Colors.grey)),
  );
}
