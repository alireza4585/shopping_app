import 'package:either_dart/either.dart';
import 'package:shopping_app/data/datasource/banner_datasource.dart';
import 'package:shopping_app/data/model/banner.dart';
import 'package:shopping_app/gitit/gitit.dart';
import 'package:shopping_app/util/exception.dart';

abstract class IBannerRepository {
  Future<Either<String, List<Banner_model>>> getbanner();
}

class BannerRepository extends IBannerRepository {
  final IBannerDatasource _bannerDatasource = locator.get();
  @override
  Future<Either<String, List<Banner_model>>> getbanner() async {
    var response = await _bannerDatasource.getbanner();
    try {
      var response = await _bannerDatasource.getbanner();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.message ?? 'error');
    }
  }
}
