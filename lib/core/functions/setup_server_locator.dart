import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../Features/home/data/data_source/home_local_data_source.dart';
import '../../Features/home/data/data_source/home_remote_data_source.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../utils/api_service.dart';

final gitIt = GetIt.instance;

void setupServerLocator() {
  gitIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImp(ApiService(Dio())),
      homeLocalDataSource: HomeLocalDataSourceImp(),
    ),
  );
}
