import 'package:get_it/get_it.dart';
import 'package:nykaa/home/repositories/home_repository.dart';

import 'login/repositories/login_repository.dart';
import 'services/services.dart';
final GetIt locator  = GetIt.instance;

void setupLocator(){
  var apiClient = NetworkService();
  locator.registerFactory<LoginRepository>(() => LoginRepositoryImp(apiClient:apiClient));
  locator.registerFactory<HomeRepository>(() => HomeRepositoryImp(apiClient:apiClient));

}