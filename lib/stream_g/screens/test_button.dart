import 'dart:developer';

import 'package:flutter/material.dart';

class TestButtton extends StatefulWidget {
  const TestButtton({Key? key}) : super(key: key);

  @override
  State<TestButtton> createState() => _TestButttonState();
}

class _TestButttonState extends State<TestButtton> {
  @override
  Widget build(BuildContext context) {
    CrossFadeState fst = CrossFadeState.showFirst;

    changeState() {
      if (fst == CrossFadeState.showFirst) {
        setState(() {});
        print('inside if');
        fst = CrossFadeState.showSecond;
      } else {
        setState(() {});

        print('inside else');
        fst = CrossFadeState.showFirst;
      }
    }

    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            log('pressed  --- $fst');

            changeState();
          },
          child: AnimatedCrossFade(
            firstChild: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
            secondChild: Container(
              height: 200,
              width: 300,
              color: Colors.red,
            ),
            crossFadeState: fst,
            duration: const Duration(
              milliseconds: 400,
            ),
          ),
        ),
      ),
    );
  }
}
