class DataModel {
  int album;
  int id;
  String name;
  String url;
  String thumbnail;
  DataModel({
    required this.name,
    required this.id,
    required this.url,
    required this.thumbnail,
    required this.album,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['album'],
      id: json['id'],
      url: json['url'],
      thumbnail: json['thumbnail'],
      album: json['album'],
    );
  }
}
