import 'package:bloc_kokorin_web_4/models/user.dart';
import 'package:bloc_kokorin_web_4/services/user_api.dart';

class UsersReposytory {
  UserProvider _userProvider = UserProvider();

  Future<List<User>> getAllUsers()=> _userProvider.getUser();
}
