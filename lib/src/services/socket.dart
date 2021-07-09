import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as IO;

const socketUrl = 'https://domain';

class SocketService {
  StreamController<List<dynamic>> _socketResponse =
      StreamController<List<dynamic>>();
  IO.Socket? socket;
  dispose() {
    _socketResponse.close();
  }

  createSocketConnection() {
    socket = IO.io(
        socketUrl, IO.OptionBuilder().setTransports(['websocket']).build());
    socket!.connect().onError((error) {
      if (error != null) {
        print(error);
      }
    });
    socket!.onConnect((_) {
      socket!.emit('join', 'TOKEN_USER');
      // Join room
      socket!.emit('subscribe', 'ID_CHAT_ROOM');
    });
    socket!.onDisconnect((_) => print('disconnect'));
  }
}
