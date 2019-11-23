# flutter_zendesk_example

Demonstrates how to use the flutter_zendesk plugin.

## Getting Started

```dart
      class MyApp extends StatefulWidget {
        @override
        _MyAppState createState() => _MyAppState();
      }
      
      class _MyAppState extends State<MyApp> {
        initPlugin() async {
          try {
            await FlutterZendesk.initiateZendesk(params: {
              "appId": "YOUR_APP_ID",
              "clientId": "CLIENT_ID",
              "url": "YOUR_URL",
            });
          } on PlatformException {
            print('Failed to initiate zendesk.');
          }
        }
      
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            home: Scaffold(
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
            ),
          );
        }
      }
```

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
