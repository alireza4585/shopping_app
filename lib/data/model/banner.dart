class Banner_model {
  String thumbnail;
  String id;
  Banner_model(this.thumbnail, this.id);
  factory Banner_model.fromJson(Map<String, dynamic> Json) {
    return Banner_model(
      Json['thumbnail'],
      Json['id'],
    );
  }
}
