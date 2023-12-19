part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

// ignore: must_be_immutable
class HomeRequestSuccessState extends HomeState {
  Either<String, List<Banner_model>> bannerList;

  HomeRequestSuccessState(
    this.bannerList,
  );
}
