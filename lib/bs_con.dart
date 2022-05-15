import 'package:flutter/material.dart';

class BS extends StatefulWidget {
  const BS({Key? key}) : super(key: key);

  @override
  _BS createState() => _BS();
}

class _BS extends State<BS> {
  bool _showSecond = false;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.amber,
      onClosing: () {},
      builder: (BuildContext context) => AnimatedContainer(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: AnimatedCrossFade(
            firstChild: Container(
              constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height - 200),
//remove constraint and add your widget hierarchy as a child for first view
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.amber,
                  child: ElevatedButton(
                    onPressed: () => setState(() => _showSecond = true),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Suivant"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            secondChild: Container(
              constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height / 3),
//remove constraint and add your widget hierarchy as a child for second view
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.blueGrey,
                  child: ElevatedButton(
                    onPressed: () => setState(() => _showSecond = false),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("ok"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            crossFadeState: _showSecond
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 400)),
        duration: const Duration(milliseconds: 400),
      ),
    );
  }
}
