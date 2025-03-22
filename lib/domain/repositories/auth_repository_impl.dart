import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:money_mate/data/models/user_model.dart';
import 'package:money_mate/data/repositories/auth_repository.dart';
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
}
