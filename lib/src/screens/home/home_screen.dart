import 'package:flutter/material.dart';
import 'package:flutter_architecture/main.dart';
import 'package:flutter_architecture/src/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_architecture/src/services/socket.dart';
import 'package:flutter_architecture/src/utils/sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home Screen',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 25.sp),
            BlocProvider(
              create: (_) => AuthenticationBloc(),
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (_, state) => GestureDetector(
                  onTap: () {
                    _
                        .read<AuthenticationBloc>()
                        .add(AuthenticationEvent.logout);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.sp,
                      vertical: 8.sp,
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
