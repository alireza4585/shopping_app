import 'package:dio/dio.dart';
import 'package:shopping_app/data/model/products.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/exception.dart';

abstract class IProductDatasource {
  Future<List<Products>> getProduct();
}

class ProductRemoteDatasource extends IProductDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Products>> getProduct() async {
    var response = await _dio.get('collections/Product/records');
    try {
      return response.data["items"]
          .map<Products>((jsonObject) => Products.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    }
  }
}
