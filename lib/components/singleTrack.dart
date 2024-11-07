import 'package:flutter/material.dart';

class Singletrack extends StatelessWidget {
  final String name;
  const Singletrack({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color.fromARGB(255, 118, 109, 109),
          ),
          borderRadius: BorderRadius.circular(7)),
      child: Row(children: [
        Expanded(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ),
      ]),
    );
  }
}
