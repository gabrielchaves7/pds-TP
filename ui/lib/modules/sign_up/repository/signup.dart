import 'package:premium_todo/modules/sign_up/repository/user.dart';

class Signup {
  Signup({required this.username, required this.password, required this.role});

  final String username;
  final String password;
  final UserRole role;
}
