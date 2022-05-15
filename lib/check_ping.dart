import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;

checkPing() {
  int count = 0;
  Timer.periodic(
    const Duration(seconds: 5),
    (timer) async {
      log(' === checking ping ===');

      http.Response response;

      try {
        response = await http
            .get(Uri.parse('https://api.cloudflare.com/'))
            .timeout(const Duration(seconds: 5), onTimeout: () {
          return http.Response('timeout', 408);
        });
      } catch (e) {
        log('----------------- not connected to internet -----------------');
        log(e.toString());
        response = http.Response('timeout', 408);
      }

      String message = response.statusCode == 200
          ? "Internet available"
          : "Internet not available";
      log('SN. $count == || ==>>> $message');
      count++;
    },
  );
}
