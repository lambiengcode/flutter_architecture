import 'package:flutter_architecture/src/services/socket.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class DependencyInjection {
  Injector initialiseSocket(Injector injector) {
    injector.map<SocketService>((i) => SocketService(), isSingleton: true);
    return injector;
  }
}
