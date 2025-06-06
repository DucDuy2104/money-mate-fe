import 'package:money_mate/domain/entities/login_data.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class AuthRepository {
  ResultFuture<User> register(String email, String password);
  ResultFuture<bool> sendVerificationCode(String userId);
  ResultFuture<User> verification(String userId, String code);
  ResultFuture<LoginData> login(String email, String password);
  ResultFuture<LoginData> refreshToken();
  ResultFuture<LoginData> signinWithGoogle(String idToken);
}