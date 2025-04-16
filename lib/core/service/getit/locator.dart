import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/service/langs/localization_service.dart';
import 'package:money_mate/core/service/local_storage/app_storage.dart';
import 'package:money_mate/core/service/socket/socket_service.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';
import 'package:money_mate/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:money_mate/data/data_sources/remote/bots_remote_data_source.dart';
import 'package:money_mate/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:money_mate/data/data_sources/remote/conversation_remote_data_source.dart';
import 'package:money_mate/data/data_sources/remote/messages_remote_data_source.dart';
import 'package:money_mate/data/data_sources/remote/statistic_remote_data_source.dart';
import 'package:money_mate/data/data_sources/remote/transactions_remote_data_source.dart';
import 'package:money_mate/data/data_sources/remote/users_remote_data_source.dart';
import 'package:money_mate/data/repositories/auth_repository.dart';
import 'package:money_mate/data/repositories/bots_repository.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/data/repositories/conversation_repository.dart';
import 'package:money_mate/data/repositories/messages_repository.dart';
import 'package:money_mate/data/repositories/statistic_repository.dart';
import 'package:money_mate/data/repositories/transactions_repository.dart';
import 'package:money_mate/data/repositories/users_repository.dart';
import 'package:money_mate/domain/repositories/auth_repository_impl.dart';
import 'package:money_mate/domain/repositories/bots_repository_impl.dart';
import 'package:money_mate/domain/repositories/categories_repository_impl.dart';
import 'package:money_mate/domain/repositories/conversation_repository_impl.dart';
import 'package:money_mate/domain/repositories/messages_repository_impl.dart';
import 'package:money_mate/domain/repositories/statistic_repository_impl.dart';
import 'package:money_mate/domain/repositories/transactions_repository_impl.dart';
import 'package:money_mate/domain/repositories/users_repository_impl.dart';
import 'package:money_mate/shared/helper/upload_helper.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Avoid re-registering
  if (getIt.isRegistered<AppStorage>()) return;

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

  // Localization service
  getIt.registerLazySingleton<LocalizationService>(
      () => LocalizationService(getIt<OnboardLocalDataSource>()));

  // SocketService
  getIt.registerLazySingleton<SocketService>(
      () => SocketService(getIt<OnboardLocalDataSource>()));

  // ApiClient
  getIt.registerLazySingleton<ApiClient>(
      () => ApiClientImpl(configureDio(getIt<OnboardLocalDataSource>())));

  // Upload Helper
  getIt.registerLazySingleton<UploadHelper>(() => UploadHelper());

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

  // UsersRemoteDataSources
  getIt.registerLazySingleton<UsersRemoteDataSource>(
      () => UsersRemoteDataSourceImpl(getIt<ApiClient>()));

  // CategoriesRemoteDataSources
  getIt.registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl(getIt<ApiClient>()));

  // ConversationRemoteDataSources
  getIt.registerLazySingleton<ConversationRemoteDataSource>(
      () => ConversationRemoteDataSourceImpl(getIt<ApiClient>()));

  // MessagesRemoteDataSources
  getIt.registerLazySingleton<MessagesRemoteDataSource>(
      () => MessagesRemoteDataSourceImpl(getIt<ApiClient>()));

  // TransactionsRemoteDataSources
  getIt.registerLazySingleton<TransactionsRemoteDataSource>(
      () => TransactionsRemoteDataSourceImpl(getIt<ApiClient>()));

  // StatisticRemoteDataSources
  getIt.registerLazySingleton<StatisticRemoteDataSource>(
      () => StatisticRemoteDataSourceImpl(getIt<ApiClient>()));

  // BotsRemoteDataSources
  getIt.registerLazySingleton<BotsRemoteDataSource>(
      () => BotsRemoteDataSourceImpl(getIt<ApiClient>()));
}

registerRepositories() {
  // Register Repositories
  //...

  // AuthRepository
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));

  // UsersRepository
  getIt.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(getIt<UsersRemoteDataSource>()));

  // CategoriesRepository
  getIt.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(getIt<CategoriesRemoteDataSource>()));

  // ConversationRepository
  getIt.registerLazySingleton<ConversationRepository>(
      () => ConversationRepositoryImpl(getIt<ConversationRemoteDataSource>()));

  // MessagesRepository
  getIt.registerLazySingleton<MessagesRepository>(
    () => MessagesRepositoryImpl(getIt<MessagesRemoteDataSource>()),
  );

  // TransactionsRepository
  getIt.registerLazySingleton<TransactionsRepository>(
      () => TransactionsRepositoryImpl(getIt<TransactionsRemoteDataSource>()));

  // StatisticRepository
  getIt.registerLazySingleton<StatisticRepository>(
      () => StatisticRepositoryImpl(getIt<StatisticRemoteDataSource>()));

  // BotsRepository
  getIt.registerLazySingleton<BotsRepository>(
      () => BotsRepositoryImpl(getIt<BotsRemoteDataSource>()));
}
