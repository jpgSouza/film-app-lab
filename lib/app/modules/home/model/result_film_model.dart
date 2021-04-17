class ResultFilmModel {
  final String title;
  final String image;
  final String id;

  ResultFilmModel({
    this.title,
    this.image,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'id': id,
    };
  }

  factory ResultFilmModel.fromJson(Map<String, dynamic> json) {
    return ResultFilmModel(
      title: json['title'],
      image: json['image'],
      id: json['id'],
    );
  }
}
