import 'package:either_dart/either.dart';
import 'package:shopping_app/data/datasource/product_detail_darasource.dart';
import 'package:shopping_app/data/model/product_detail_model.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/exception.dart';

abstract class IProductDetailRepository {
  Future<Either<String, List<Product_detail>>> getDetail(String id);
}

class ProductDetailRepository extends IProductDetailRepository {
  final IProductDetailDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Product_detail>>> getDetail(String id) async {
    try {
      var response = await _datasource.getDetail(id);
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'error');
    }
  }
}
