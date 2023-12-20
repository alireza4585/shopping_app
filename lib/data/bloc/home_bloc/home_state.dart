import 'package:either_dart/either.dart';
import 'package:shopping_app/data/model/banner.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

// ignore: must_be_immutable
class HomeRequestSuccessState extends HomeState {
  Either<String, List<Banner_model>> bannerList;

  HomeRequestSuccessState(
    this.bannerList,
  );
}
