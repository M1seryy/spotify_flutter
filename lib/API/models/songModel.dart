class SongItem {
  String name;
  String coverArt;
  String id;

  SongItem({required this.name, required this.coverArt, required this.id});

  factory SongItem.fromJson(Map<String, dynamic> json) {
    return SongItem(
      name: json['name'],
      coverArt: json['coverArt'],
      id: json['id'],
    );
  }
}

class AlbumSong {
  String name;

  AlbumSong({required this.name});

  factory AlbumSong.fromJson(Map<String, dynamic> json) {
    return AlbumSong(
      name: json['name'],
    );
  }
}
