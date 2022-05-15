import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('got page ');
    return Scaffold(
      body: ListView.separated(
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Text('data ${index + 1}');
        },
      ),
    );
  }
}
