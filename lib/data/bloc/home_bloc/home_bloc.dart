import 'package:bloc/bloc.dart';
import 'package:shopping_app/data/bloc/home_bloc/home_event.dart';
import 'package:shopping_app/data/bloc/home_bloc/home_state.dart';
import 'package:shopping_app/data/repository/banner_repository.dart';
import 'package:shopping_app/data/repository/product_detail_repository.dart';
import 'package:shopping_app/data/repository/products_repository.dart';
import 'package:shopping_app/gitit/gitit.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final IProductRepository _iProductRepository = locator.get();
  final IProductDetailRepository _detailRepository = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitilzeData>((event, emit) async {
      emit(HomeLoadingState());
      var bannerList = await _bannerRepository.getbanner();
      var productList = await _iProductRepository.getProduct();
      var detailList = await _detailRepository.getDetail();

      emit(HomeRequestSuccessState(bannerList, productList, detailList));
    });
  }
}
