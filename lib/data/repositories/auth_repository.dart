import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class AuthRepository {
  ResultFuture<User> register(String email, String password);
  ResultFuture<bool> sendVerificationCode(String userId);
}