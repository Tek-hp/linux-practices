import 'package:flutter/material.dart';
import 'package:someapp/logger/custom_logger.dart';

class LoggerTest extends StatelessWidget {
  const LoggerTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showError('This is error message');
              },
              child: const Text('error'),
            ),
            ElevatedButton(
              onPressed: () {
                showWarning('This is warning message');
              },
              child: const Text('warning'),
            ),
            ElevatedButton(
              onPressed: () {
                showInfo('This is info message');
              },
              child: const Text('info'),
            ),
          ],
        ),
      ),
    );
  }
}
