import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:someapp/http_ser.dart';

class HttpTest extends StatefulWidget {
  const HttpTest({Key? key}) : super(key: key);

  @override
  State<HttpTest> createState() => _HttpTestState();
}

class _HttpTestState extends State<HttpTest> {
  late Widget child;
  final HttpSer _service = HttpSer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            showTheWillOfD(processingChild());
            await getData();
          },
          child: const Text('Get data'),
        ),
      ),
    );
  }

  getData() async {
    log('getting data');
    Response response = await _service.getData();

    if (response.statusCode == 1014) {
      Navigator.popUntil(
        context,
        (route) => route.isFirst,
      );
      Logger().i('response on time out == ${response.body}');
      showTheWillOfD(timeoutChild());
    } else if (response.statusCode == 200) {
      Navigator.popUntil(
        context,
        (route) => route.isFirst,
      );

      Logger().i('Data :::::: \n${response.body}');
    } else {
      Navigator.popUntil(
        context,
        (route) => route.isFirst,
      );
      showTheWillOfD(wrongChild());
    }
  }

  showTheWillOfD(Widget child) {
    showDialog(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  processingChild() {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.blue[100],
      ),
      child: Column(
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            height: 10,
          ),
          Text('processing'),
        ],
      ),
    );
  }

  timeoutChild() {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.blue[400],
      ),
      child: Column(
        children: const [
          Icon(Icons.timer_off),
          SizedBox(
            height: 10,
          ),
          Text('time out'),
        ],
      ),
    );
  }

  wrongChild() {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.blue[100],
      ),
      child: Column(
        children: const [
          Icon(Icons.close),
          SizedBox(
            height: 10,
          ),
          Text('Something went wrong'),
        ],
      ),
    );
  }
}
