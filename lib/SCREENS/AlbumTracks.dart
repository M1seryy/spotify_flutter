import 'package:flutter/material.dart';

class AlbumTracks extends StatefulWidget {
  String id;
  String image;

  AlbumTracks({super.key, required this.id, required this.image});

  @override
  State<AlbumTracks> createState() => _AlbumTracksState();
}

class _AlbumTracksState extends State<AlbumTracks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 90),
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.network(widget.image),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
