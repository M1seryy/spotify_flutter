import 'package:flutter/material.dart';
import 'package:flutter_spotify/API/api_request.dart';
import 'package:flutter_spotify/API/models/songModel.dart';
import 'package:flutter_spotify/components/singleTrack.dart';

class AlbumTracks extends StatefulWidget {
  final String id;
  final String image;

  AlbumTracks({required this.id, required this.image});

  @override
  State<AlbumTracks> createState() => _AlbumTracksState();
}

class _AlbumTracksState extends State<AlbumTracks> {
  List<AlbumSong> tracks = [];

  void initState() {
    print("init");
    checkApi();
  }

  Future<void> checkApi() async {
    final apiData;
    final responce = await getAlbumSong(widget.id);
    apiData = responce;
    // print(apiData);
    // print(apiData[0].name);
    setState(() {
      tracks = apiData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 30),
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: Navigator.of(context).pop,
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.white,
                )),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: Image.network(widget.image),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: tracks.length,
                  itemBuilder: (context, index) {
                    return Singletrack(
                        name: tracks.length > 1
                            ? tracks[index].name
                            : "Not found");
                    // Text(
                    //   tracks.length > 1 ? tracks[index].name : "Not found",
                    //   style: TextStyle(color: Colors.white),
                    // );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
