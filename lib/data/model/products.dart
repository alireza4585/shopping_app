class Products {
  String name;
  String image;
  String id;
  String collectionId;
  double price;
  int discount;
  bool have_discount;
  num? priceWithdisconunt;
  Products(
    this.collectionId,
    this.discount,
    this.id,
    this.image,
    this.name,
    this.price,
    this.have_discount,
  ) {
    priceWithdisconunt = ((price * (discount / 100)) - price) * (-1);
  }

  factory Products.fromJson(Map<String, dynamic> jsonObject) {
    return Products(
      jsonObject['collectionId'],
      jsonObject['discount'],
      jsonObject['id'],
      'https://pocketbase--bmabfep1.iran.liara.run/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['product_Image']}',
      jsonObject['name'],
      jsonObject['price'],
      jsonObject['have_discount'],
    );
  }
}
