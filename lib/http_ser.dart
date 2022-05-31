import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HttpSer {
  getData() async {
    log('inside service');

    var response = await http.get(
      Uri.parse(
          'https://api.iot.bottle.com.np/dev/device/cc4bc02b-d505-4278-acf9-55b711046b59'),
      headers: {'X-API-KEY': 'OznBzl4K5W8KHk5mMoPyj9xdOEMydhXC3Op8JSXB'},
    ).timeout(
      const Duration(milliseconds: 1000),
      onTimeout: () {
        Logger().w('Timeout');
        return http.Response('timeout', 1014);
      },
    );

    return response;
  }
}
