abstract class ProductEvent {}

class ProductGetInitilzeData extends ProductEvent {
  String id;
  ProductGetInitilzeData(this.id);
}
