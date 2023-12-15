import 'package:get_it/get_it.dart';
import 'package:shopping_app/data/datasource/banner_datasource.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  _initDatasoruces();

  _initRepositories();
}

void _initDatasoruces() {
  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());
}

void _initRepositories() {}
