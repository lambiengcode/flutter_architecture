import 'package:flutter/material.dart';
import 'package:flutter_architecture/main.dart';
import 'package:flutter_architecture/src/services/socket.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Connect and listen socket
    injector.get<SocketService>().createSocketConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
