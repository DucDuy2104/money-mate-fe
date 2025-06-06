import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:money_mate/data/models/login_data_model.dart';
import 'package:money_mate/data/models/user_model.dart';
import 'package:money_mate/data/repositories/auth_repository.dart';
import 'package:money_mate/domain/entities/login_data.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepositoryImpl(this._authRemoteDataSource);
  @override
  ResultFuture<User> register(String email, String password) async {
    final result = await _authRemoteDataSource.register(email, password);
    return result.fold(
        (failure) => Left(failure), (userModel) => Right(userModel.toEntity()));
  }

  @override
  ResultFuture<bool> sendVerificationCode(String userId) async {
    final result = await _authRemoteDataSource.sendVerificationCode(userId);
    return result.fold(
        (failure) => Left(failure), (isSuccess) => Right(isSuccess));
  }

  @override
  ResultFuture<User> verification(String userId, String code) async {
    final result = await _authRemoteDataSource.verification(userId, code);
    return result.fold(
        (failure) => Left(failure), (userModel) => Right(userModel.toEntity()));
  }

  @override
  ResultFuture<LoginData> login(String email, String password) async {
    final result = await _authRemoteDataSource.login(email, password);
    return result.fold((failure) => Left(failure),
        (loginDataModel) => Right(loginDataModel.toEntity()));
  }
  
  @override
  ResultFuture<LoginData> refreshToken() async {
    final result = await _authRemoteDataSource.refreshToken();
    return result.fold((failure) => Left(failure),
        (loginDataModel) => Right(loginDataModel.toEntity()));
  }
  
  @override
  ResultFuture<LoginData> signinWithGoogle(String idToken) async {
    final result = await _authRemoteDataSource.signinWithGoogle(idToken);
    return result.fold((failure) => Left(failure),
        (loginDataModel) => Right(loginDataModel.toEntity()));
  }
}
