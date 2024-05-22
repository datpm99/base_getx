class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  List<dynamic> listRole = [];

  void initRole(String token) {}

  /// Check Role Task.
  bool showMenuTask() {
    return true;
  }
}
