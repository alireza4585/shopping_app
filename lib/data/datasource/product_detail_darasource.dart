import 'package:dio/dio.dart';
import 'package:shopping_app/data/model/product_detail_model.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/exception.dart';

abstract class IProductDetailDatasource {
  Future<List<Product_detail>> getDetail();
}

class IproductDetailRemote extends IProductDetailDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Product_detail>> getDetail() async {
    try {
      var response = await _dio.get('collections/products_Detail/records');
      return response.data['items']
          .map<Product_detail>(
              (jsonObject) => Product_detail.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    }
  }
}
