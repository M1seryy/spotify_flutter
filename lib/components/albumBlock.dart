import 'package:flutter/material.dart';
import 'package:flutter_spotify/SCREENS/AlbumTracks.dart';

class Albumblock extends StatelessWidget {
  String wallpaper;
  String name;
  String id;
  Albumblock({required this.wallpaper, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AlbumTracks(
                            id: id,
                            image: wallpaper,
                          ))),
            },
            child: Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white),
                child: wallpaper != "" ? Image.network(wallpaper) : null),
          ),
        ),
        Text(
          name,
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
