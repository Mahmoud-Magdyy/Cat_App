import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/data/reposatiory/get_cats_repo.dart';
import '../../features/presentation/cubit/cat_cubit.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLocator() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => CatRepository());
  sl.registerLazySingleton(() => CatCubit(sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
}
