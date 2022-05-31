import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http_client_helper/http_client_helper.dart';
import 'package:someapp/http_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with 'flutter run'. You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // 'hot reload' (press 'r' in the console where you ran 'flutter run',
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HttpTest(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CancellationToken? cancellationToken;
  String msg = '';

  Future<void> request() async {
    final Uri url = Uri.parse('https://api.tuchong.com/feed-app');
    //url = 'https://google.com';
    setState(() {
      msg = 'begin request';
    });
    cancellationToken = CancellationToken();
    try {
      await HttpClientHelper.get(
        url,
        cancelToken: cancellationToken,
        timeRetry: const Duration(milliseconds: 100),
        retries: 3,
        timeLimit: const Duration(seconds: 5),
      ).then((Response? response) {
        setState(() {
          msg = response!.body;
        });
      });
    } on TimeoutException catch (_) {
      setState(() {
        msg = 'TimeoutException';
      });
    } on OperationCanceledError catch (_) {
      setState(() {
        msg = 'cancel';
      });
    } catch (e) {
      setState(() {
        msg = '$e';
      });
    }
  }

  void cancel() {
    cancellationToken?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title!),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      request();
                    },
                    child: const Text('Requset')),
                TextButton(
                    onPressed: () {
                      cancel();
                    },
                    child: const Text('Cancel'))
              ],
            ),
            Expanded(
              child: Text(msg),
            )
          ],
        ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Page2(),
          ),
        ),
        child: Image.asset(
          'assets/images/view_static.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
