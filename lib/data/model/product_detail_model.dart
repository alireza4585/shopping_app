class Product_detail {
  double rank;
  String id;
  String collectionId;
  String explain;
  List images;
  // String sizes;
  List imageUrl = [];
  String name;
  double price;
  int discount;
  bool have_discount;
  num? priceWithdisconunt;
  Product_detail(
    this.explain,
    this.images,
    this.rank,
    // this.sizes,
    this.collectionId,
    this.id,
    this.discount,
    this.have_discount,
    this.name,
    this.price,
  ) {
    for (int i = 0; i < images.length; i++) {
      imageUrl.add(
          'https://pocketbase--bmabfep1.iran.liara.run/api/files/${collectionId}/${id}/${images[i]}');
    }
    priceWithdisconunt = ((price * (discount / 100)) - price) * (-1);
  }
  factory Product_detail.fromJson(Map<String, dynamic> jsonObject) {
    return Product_detail(
      jsonObject['explain'],
      jsonObject['images'],
      jsonObject['rank'],
      // jsonObject['sizes'],
      jsonObject['collectionId'],
      jsonObject['id'],
      jsonObject['expand']['product']['discount'],
      jsonObject['expand']['product']['have_discount'],
      jsonObject['expand']['product']['name'],
      jsonObject['expand']['product']['price'],
    );
  }
}
