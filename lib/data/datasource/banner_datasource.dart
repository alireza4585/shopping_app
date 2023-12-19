// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:shopping_app/data/model/banner.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/exception.dart';

abstract class IBannerDatasource {
  Future<List<Banner_model>> getbanner();
}

class BannerRemoteDatasource extends IBannerDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Banner_model>> getbanner() async {
    var respones = await _dio.get('collections/Banner/records');
    try {
      return respones.data["items"]
          .map<Banner_model>((Json) => Banner_model.fromJson(Json))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
