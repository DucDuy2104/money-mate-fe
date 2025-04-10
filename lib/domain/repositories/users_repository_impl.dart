import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/users_remote_data_source.dart';
import 'package:money_mate/data/models/user_model.dart';
import 'package:money_mate/data/repositories/users_repository.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

class UsersRepositoryImpl extends UsersRepository {
  final UsersRemoteDataSource _usersRemoteDataSource;
  UsersRepositoryImpl(this._usersRemoteDataSource);
  @override
  ResultFuture<User> update(Map<String, dynamic> body) async {
    final result = await _usersRemoteDataSource.update(body);
    return result.fold(
        (failure) => Left(failure), (userModel) => Right(userModel.toEntity()));
  }

  @override
  ResultFuture<User> getProfile() async {
    final result = await _usersRemoteDataSource.getProfile();
    return result.fold(
        (failure) => Left(failure), (userModel) => Right(userModel.toEntity()));
  }

  @override
  ResultFuture<User> updatePass(String oldPass, String newPass) async {
    final result = await _usersRemoteDataSource.updatePass(oldPass, newPass);
    return result.fold(
        (failure) => Left(failure), (userModel) => Right(userModel.toEntity()));
  }

  @override
  ResultFuture<User> getUserViaEmail(String email) async {
    final result = await _usersRemoteDataSource.getUserViaEmail(email);
    return result.fold(
        (failure) => Left(failure), (userModel) => Right(userModel.toEntity()));
  }

  @override
  ResultFuture<User> resetPassword(String id, String password) async {
    final result = await _usersRemoteDataSource.resetPassword(id, password);
    return result.fold(
        (failure) => Left(failure), (userModel) => Right(userModel.toEntity()));
  }
}
