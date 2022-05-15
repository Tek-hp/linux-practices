import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoggerTest extends StatelessWidget {
  const LoggerTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                logger.e('This is error msg');
              },
              child: const Text('error'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.w('This is warning msg');
              },
              child: const Text('warning'),
            ),
            ElevatedButton(
              onPressed: () {
                logger.i('This is info message');
              },
              child: const Text('info'),
            ),
          ],
        ),
      ),
    );
  }
}
