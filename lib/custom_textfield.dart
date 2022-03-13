import 'package:flutter/material.dart';

BoxDecoration boxDecoration = BoxDecoration(
    color: const Color.fromARGB(255, 218, 184, 223),
    borderRadius: BorderRadius.circular(4));

Widget customTextField(context, title, data) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title:",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: (title == 'Address' ||
                  title == 'Price' ||
                  title == 'Function' ||
                  title == 'Date')
              ? BoxDecoration(
                  color: const Color.fromARGB(255, 181, 144, 187),
                  borderRadius: BorderRadius.circular(4))
              : boxDecoration,
          padding: const EdgeInsets.all(8),
          child: RichText(
              text: TextSpan(
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            text: "$data",
          )),
        ),
      ],
    ),
  );
}
