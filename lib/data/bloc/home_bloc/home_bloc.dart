import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/data/model/banner.dart';
import 'package:shopping_app/data/repository/banner_repository.dart';
import 'package:shopping_app/gitit/gitit.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      emit(HomeLoadingState());
      var bannerlist = await _bannerRepository.getbanner();
      emit(HomeRequestSuccessState(bannerlist));
    });
  }
}
