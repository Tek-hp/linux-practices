import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:process_run/shell_run.dart';

class WifiModel {
  final String bssid, ssid, mode, security;
  final int channel, rate, signal, bars;
  final bool inUse;

  WifiModel({
    required this.bssid,
    required this.ssid,
    required this.mode,
    required this.security,
    required this.channel,
    required this.rate,
    required this.signal,
    required this.bars,
    required this.inUse,
  });
}

class ShellDataTest extends StatefulWidget {
  const ShellDataTest({Key? key}) : super(key: key);

  @override
  State<ShellDataTest> createState() => _ShellDataTestState();
}

class _ShellDataTestState extends State<ShellDataTest> {
  String data = '...';

  sellMe() {
    setState(() {
      data = 'fetching...';
    });
    var shell = Shell();
    Logger().i('inside shell me');

    shell.run('nmcli dev wifi list').then(
          (value) => setState(
            () {
              data = value.outText;

              for (final op in value.outLines) {
                final _newOp = op.replaceAll(RegExp('\\s{2,}'), ',').split(',');

                final _inUse = _newOp[0] == '*';
                final _bssid = _newOp[1];
                final _ssid = _newOp[2];
                final _mode = _newOp[3];
                final _channel = int.parse(_newOp[4]);
                final _rate = _newOp[5].split(' ').first;
                final _signal = int.parse(_newOp[6]);
                final _bars = _newOp[7].length;
                final _security = _newOp[8];

                
              }
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => sellMe(),
        child: const Icon(Icons.get_app),
      ),
    );
  }
}
