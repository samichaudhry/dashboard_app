import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  Widget _userData(userName, image, onPressedFunc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          userName,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: onPressedFunc,
              icon: const Icon(Icons.keyboard_arrow_down_rounded)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: CircleAvatar(
            foregroundImage: NetworkImage(image),
            backgroundColor: const Color(0xFFfedd69),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Text(
              "Overview",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Search something...",
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
              child: _userData(
                  "XYZ",
                  "https://cdn.pixabay.com/photo/2015/03/04/22/35/head-659652_960_720.png",
                  () {}))
        ],
      ),
    );
  }
}
