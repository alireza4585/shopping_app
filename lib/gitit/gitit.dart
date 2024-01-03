import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/data/datasource/authentication_datasource.dart';
import 'package:shopping_app/data/datasource/banner_datasource.dart';
import 'package:shopping_app/data/datasource/product_detail_darasource.dart';
import 'package:shopping_app/data/datasource/products_datasource.dart';
import 'package:shopping_app/data/repository/authentication_repository.dart';
import 'package:shopping_app/data/repository/banner_repository.dart';
import 'package:shopping_app/data/repository/product_detail_repository.dart';
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
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}

Future<void> _initDatasoruces() async {
  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());
  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());
  locator.registerFactory<IProductDatasource>(() => ProductRemoteDatasource());
  locator
      .registerFactory<IProductDetailDatasource>(() => IproductDetailRemote());
}

void _initRepositories() {
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<IProductRepository>(() => ProductRepository());
  locator.registerFactory<IProductDetailRepository>(
      () => ProductDetailRepository());
}
