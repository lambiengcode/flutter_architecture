import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_architecture/src/models/user.dart';
import 'package:flutter_architecture/src/providers/user_provider.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    switch (event) {
      case AuthenticationEvent.login:
        // Call api login, if success run below
        User user = User(
          accessToken: 'USER_TOKEN',
          fullName: 'USER_FULL_NAME',
        );
        state.login(user);
        break;
      case AuthenticationEvent.logout:
        state.logout();
        break;
      default:
        break;
    }
  }
}
