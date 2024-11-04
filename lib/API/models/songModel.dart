class SongItem {
  String name;
  String coverArt;
  String id;

  SongItem({required this.name, required this.coverArt,required this.id});

  factory SongItem.fromJson(Map<String, dynamic> json) {
    return SongItem(
      name: json['name'],
      coverArt: json['coverArt'],
       id: json['id'],
    );
  }
}