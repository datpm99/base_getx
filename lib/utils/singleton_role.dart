class SingletonRole {
  static final SingletonRole _singleton = SingletonRole._internal();

  factory SingletonRole() {
    return _singleton;
  }

  SingletonRole._internal();

  List<dynamic> listRole = [];

  void initRole(String token) {}

  /// Check Role Task.
  bool showMenuTask() {
    return true;
  }
}
