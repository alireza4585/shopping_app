class Product_detail {
  String rank;
  String id;
  String collectionId;
  String explain;
  List images;
  String sizes;
  List imageUrl = [];
  Product_detail(this.explain, this.images, this.rank, this.sizes,
      this.collectionId, this.id) {
    for (int i = 0; i <= images.length; i++) {
      imageUrl.add(
          'https://pocketbase--bmabfep1.iran.liara.run/api/files/${collectionId}/${id}/${images[i]}');
    }
  }
  factory Product_detail.fromJson(Map<String, dynamic> jsonObject) {
    return Product_detail(
      jsonObject['explain'],
      jsonObject['images'],
      jsonObject['rank'],
      jsonObject['sizes'],
      jsonObject['sizes'],
      jsonObject['id'],
    );
  }
}
