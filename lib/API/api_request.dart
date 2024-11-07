import 'dart:convert';

import 'package:flutter_spotify/API/models/songModel.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'x-rapidapi-key': 'b7b47a470emsh94ed39b08cdb69ap1b1ff5jsn35cacba5e3e8',
  'x-rapidapi-host': 'spotify-downloader9.p.rapidapi.com'
};

Future<List<SongItem>> fetchSongs(String artist) async {
  print('song fetch');
  final url =
      'https://spotify-downloader9.p.rapidapi.com/search?q=$artist&type=multi&limit=20&offset=0&noOfTopResults=5';
  if (artist != "") {
    final uri = Uri.parse(url);
    final responce = await http.get(uri, headers: requestHeaders);
    final json = jsonDecode(responce.body);
    final mainData = json['data']['albums']['items'];
    // final listJson = (json as List<dynamic>).toList();
    final listJson = (mainData as List<dynamic>).toList();
    // print(listJson);
    // final testRes =
    //     listJson.map((element) => {print(element['data']['name'])}).toList(); f

    final transformed = listJson
        .map((element) => SongItem(
              name: element['name'],
              coverArt: element['coverArt'][0]["url"],
              id: element['id'],
            ))
        .toList();
    // print(transformed[0].name);
    return transformed;
  } else {
    return [];
  }
}

Map<String, String> AlbumRequestHeaders = {
  'Content-type': 'application/json',
  'x-rapidapi-key': 'b7b47a470emsh94ed39b08cdb69ap1b1ff5jsn35cacba5e3e8',
  'x-rapidapi-host': 'spotify23.p.rapidapi.com'
};

Future<List<AlbumSong>> getAlbumSong(String trackId) async {
  if (trackId != "") {
    final url =
        'https://spotify23.p.rapidapi.com/album_tracks/?id=$trackId&offset=0&limit=300';

    print("start");
    final uri = Uri.parse(url);
    final responce = await http.get(uri, headers: AlbumRequestHeaders);
    final json = jsonDecode(responce.body);
    final mainData = json['data']['album']['tracks']['items'];
    // final listJson = (json as List<dynamic>).toList();
    final listJson = (mainData as List<dynamic>).toList();
    // print(listJson);
    // final testRes =
    //     listJson.map((element) => {print(element['data']['name'])}).toList(); f

    // print(listJson);
    final transformed = listJson
        .map((element) => AlbumSong(
              name: element['track']['name'],
            ))
        .toList();

    return transformed;
  } else {
    print("empty arr");
    return [];
  }
}
