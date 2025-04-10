import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class UsersRepository {
  ResultFuture<User> update(Map<String, dynamic> body);
  ResultFuture<User> getProfile();
  ResultFuture<User> updatePass(String oldPass, String newPass);
}