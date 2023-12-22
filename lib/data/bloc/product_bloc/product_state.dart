import 'package:either_dart/either.dart';
import 'package:shopping_app/data/model/product_detail_model.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductLoadingState extends ProductState {}

// ignore: must_be_immutable
class ProductRequestSuccessState extends ProductState {
  // ignore: non_constant_identifier_names
  Either<String, List<Product_detail>> ProductdetailList;

  ProductRequestSuccessState(this.ProductdetailList);
}
