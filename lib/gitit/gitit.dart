import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_app/data/datasource/banner_datasource.dart';
import 'package:shopping_app/data/datasource/products_datasource.dart';
import 'package:shopping_app/data/repository/banner_repository.dart';
import 'package:shopping_app/data/repository/products_repository.dart';
import 'package:shopping_app/util/dio.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  await _initComponents();
  await _initDatasoruces();

  _initRepositories();
}

Future<void> _initComponents() async {
  locator.registerSingleton<Dio>(DioProvider.createDioWithoutHeader());
}

Future<void> _initDatasoruces() async {
  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());
  locator.registerFactory<IProductDatasource>(() => ProductRemoteDatasource());
}

void _initRepositories() {
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<IProductRepository>(() => ProductRepository());
}
