part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  login(User user) {}
  logout() {}
}

class AuthenticationInitial extends AuthenticationState {
  @override
  login(User user) {
    userProvider.loginMapUser(user);
    return super.login(user);
  }

  @override
  logout() {
    userProvider.logout();
    return super.logout();
  }
}
