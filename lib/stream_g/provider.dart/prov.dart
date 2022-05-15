import 'package:flutter/widgets.dart';
import 'package:web_socket_channel/io.dart';

class WebSockerStreamer extends ChangeNotifier {
  final _webSocketStream = IOWebSocketChannel.connect(
    Uri.parse('192.168.2.112'),
  ).stream.asBroadcastStream();

  socketData() async* {
    var _event;

    _webSocketStream.listen(
      (event) {
        _event = event;
      },
    );

    yield _event;
  }
}
