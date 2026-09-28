import '../models/data.dart';

class LoginController {
  bool login(String username, String password) {
    if (username == user1.username && password == user1.password) {
      return true;
    }

    return false;
  }
}
