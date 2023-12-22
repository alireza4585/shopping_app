import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/data/bloc/product_bloc/product_event.dart';
import 'package:shopping_app/data/bloc/product_bloc/product_state.dart';
import 'package:shopping_app/data/repository/product_detail_repository.dart';
import 'package:shopping_app/gitit/gitit.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRepository _detailRepository = locator.get();

  ProductBloc() : super(ProductInitState()) {
    on<ProductGetInitilzeData>((event, emit) async {
      emit(ProductLoadingState());
      var productdetailList = await _detailRepository.getDetail();

      emit(ProductRequestSuccessState(productdetailList));
    });
  }
}
