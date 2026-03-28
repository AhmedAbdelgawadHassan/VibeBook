import 'package:books/core/services/api_services.dart';
import 'package:books/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart'; 

//// This is the service locator (Singleton pattern)

GetIt getIt = GetIt.instance;

void setupLocator() {
  // Here you can register other dependencies if needed
  /// I use signalReady here only to show how to use it. In 99% of the cases
  /// you don't need it. Just use registerSingletonAsync
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(apiServices: ApiServices(dio: Dio()))
  );
}