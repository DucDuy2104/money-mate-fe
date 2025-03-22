import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/service/local_storage/app_storage.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';
import 'package:money_mate/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:money_mate/data/repositories/auth_repository.dart';
import 'package:money_mate/domain/repositories/auth_repository_impl.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Ensure Hive is initialized
  await Hive.initFlutter();

  // Open the Hive box (Make sure this happens before using AppStorage)
  final appBox = await Hive.openBox('appBox');

  // Register AppStorage
  getIt.registerLazySingleton<AppStorage>(() => AppStorage(appBox));

  // Register OnboardLocalDataSource
  getIt.registerLazySingleton<OnboardLocalDataSource>(
    () => OnboardLocalDataSourceImpl(getIt<AppStorage>()),
  );

  // Register ApiClient
  getIt.registerLazySingleton<ApiClient>(
      () => ApiClientImpl(configureDio(getIt<OnboardLocalDataSource>())));

  // Register RemoteDataSources
  registerRemoteDataSources();

  // Register Repositories
  registerRepositories();
}

registerRemoteDataSources() {
  // Register RemoteDataSources
  //...

  // AuthRemoteDataSources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt<ApiClient>()));
}

registerRepositories() {
  // Register Repositories
  //...

  // AuthRepository
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));
}
