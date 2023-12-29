import 'package:either_dart/either.dart';
import 'package:shopping_app/data/model/banner.dart';
import 'package:shopping_app/data/model/products.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

// ignore: must_be_immutable
class HomeRequestSuccessState extends HomeState {
  Either<String, List<Banner_model>> bannerList;
  // ignore: non_constant_identifier_names
  Either<String, List<Products>> ProductList;

  HomeRequestSuccessState(this.bannerList, this.ProductList);
}
