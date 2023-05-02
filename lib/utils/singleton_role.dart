// import 'package:jwt_decode/jwt_decode.dart';
// import '/const/app_role.dart';

class SingletonRole {
  static final SingletonRole _singleton = SingletonRole._internal();

  factory SingletonRole() {
    return _singleton;
  }

  SingletonRole._internal();

  late Map<String, dynamic> payload;
  List<dynamic> listRole = [];

  void initRole(String token) {
    // payload = Jwt.parseJwt(token);
    // listRole = payload['aut'];
  }

  ///Check Role Task.
  bool showMenuTask() {
    // return listRole.contains(AppRole.taskCreate) ||
    //     listRole.contains(AppRole.taskViewUnit) ||
    //     listRole.contains(AppRole.taskApprove);
    return true;
  }

  // bool taskCreate() => listRole.contains(AppRole.taskCreate);

}
