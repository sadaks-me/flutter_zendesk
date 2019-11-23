import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_zendesk/flutter_zendesk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Zendesk Support",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  initPlugin() async {
    Map<String, String> param = {
      "appId": "YOUR_APP_ID",
      "clientId": "CLIENT_ID",
      "url": "YOUR_URL",
    };
    try {
      String result =
          await FlutterZendesk.initiateZendesk(params: Map.from(param));
      if (result != null) {
        print("Platform Result $result");
      }
    } on PlatformException {
      print('Failed to initiate zendesk.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zendesk App'),
      ),
      body: Center(
        child: Text('ZENDESK'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.headset_mic),
        onPressed: initPlugin,
      ),
    );
  }
}
