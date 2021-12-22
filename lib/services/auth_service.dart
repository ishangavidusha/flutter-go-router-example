import 'dart:async';

class AuthService {
  final StreamController<bool> _onAuthStateChange = StreamController.broadcast();

  Stream<bool> get onAuthStateChange => _onAuthStateChange.stream;

  Future<bool> login() async {

    // This is just to demonstrate the login process time.
    // In real-life applications, it is not recommended to interrupt the user experience by doing such things.
    await Future.delayed(const Duration(seconds: 1));

    _onAuthStateChange.add(true);
    return true;
  }

  void logOut() {
    _onAuthStateChange.add(false);
  }
}