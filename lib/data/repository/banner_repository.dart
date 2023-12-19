import 'package:either_dart/either.dart';
import 'package:shopping_app/data/datasource/banner_datasource.dart';
import 'package:shopping_app/data/model/banner.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/exception.dart';

abstract class IBannerRepository {
  Future<List<Banner_model>> getbanner();
}

class BannerRepository extends IBannerRepository {
  final IBannerDatasource _bannerDatasource = locator.get();
  @override
  Future<List<Banner_model>> getbanner() async {
    // ignore: unused_local_variable
    var response = await _bannerDatasource.getbanner();
    return response;
  }
}
