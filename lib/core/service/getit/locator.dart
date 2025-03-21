import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/service/local_storage/app_storage.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';

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
}
