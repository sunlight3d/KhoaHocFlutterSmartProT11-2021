
part of 'repositories.dart';
//const urlLogin = '$urlBase/api/address_clinic/getAll';
const urlLogin = 'http://45.15.24.65:5002/api/AuthManagement/Login';
class UserRepository {
  //singleton pattern
  UserRepository._privateConstructor();
  static final UserRepository _instance = UserRepository._privateConstructor();
  static UserRepository get instance => _instance;
  final LocalStorage userStorage = LocalStorage('userStorage');
  static User loggedInUser = User.empty;
  Future<User> login({required email, required password}) async {
    try {
      final Map<String, dynamic> parameters = Map();
      parameters['email'] = email.trim();
      parameters['password'] = '${password}';
      final json = await post(data: parameters, url: urlLogin);
      String token = json['token'] ?? '';
      Map<String, dynamic> jsonUser = json['user'];
      jsonUser['token'] = token;
      print('haha');
      return User.fromJson(jsonUser);
    }catch(error) {
      throw Exception('Exception login user: ${error.toString()}');
    }
  }
  Future<void> saveToLocalStorage({required User user}) async {
    try {
      await userStorage.ready; //async getter
      await userStorage.setItem("email", user.email);
      await userStorage.setItem("tokenKey", user.tokenKey);
      await userStorage.setItem("permission", user.permission);
      await userStorage.setItem("userName", user.userName);
      await userStorage.setItem("timestamp", convertDateTimeToString(DateTime.now()));
      UserRepository.loggedInUser = user;
    } catch(error) {
      throw Exception('Cannot save user to local storage: ${error.toString()}');
    }
  }
  Future<User> getUserFromStorage() async {
    try {
      await userStorage.ready; //async getter
      String? email = userStorage.getItem("email");
      if(email == null || email.isEmpty) {
        return User.empty;
      }
      String? tokenKey = userStorage.getItem("tokenKey");
      int permission = userStorage.getItem("permission");
      String? userName = userStorage.getItem("userName");
      DateTime timestamp = convertStringToDateTime(userStorage.getItem("timestamp")); //??
      User user = User.fromJson({
        'email': email,
        'tokenKey': tokenKey,
        'permission': permission,
        'userName': userName,
        'timestamp': timestamp,
      });
      return user;
    } catch(error) {
      throw Exception('Cannot save user to local storage: ${error.toString()}');
    }
  }

}


