import 'package:either_dart/either.dart';
import 'package:shopping_app/data/datasource/products_datasource.dart';
import 'package:shopping_app/data/model/products.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/exception.dart';

abstract class IProductRepository {
  Future<Either<String, List<Products>>> getProduct();
}

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Products>>> getProduct() async {
    try {
      var response = await _datasource.getProduct();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'error');
    }
  }
}
