import 'dart:io';

import 'package:flutter/material.dart';

class CloserApp extends StatelessWidget {
  const CloserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
          child: Text(
            'Go back',
            style: Theme.of(context).textTheme.headline1,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text(
          "Exit application",
          style: Theme.of(context).textTheme.headline1,
        ),
      )),
    );
  }
}
