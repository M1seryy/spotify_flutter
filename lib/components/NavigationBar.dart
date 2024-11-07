import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(1, 8),
      decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
      width: 200,
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: Icon(
            Icons.home,
            size: 35,
            color: const Color.fromARGB(255, 146, 151, 148),
          )),
          Expanded(
              child: Icon(
            Icons.search,
            size: 35,
            color: const Color.fromARGB(255, 146, 151, 148),
          )),
          Expanded(
              child: Icon(
            Icons.favorite,
            size: 35,
            color: const Color.fromARGB(255, 146, 151, 148),
          )),
        ],
      ),
    );
  }
}
