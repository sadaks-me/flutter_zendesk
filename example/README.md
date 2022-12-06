# flutter_zendesk

A Zendesk Support Flutter plugin.

## Getting Started

To use this plugin, add `flutter_zendesk` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Get the [Crendentials](https://www.zendesk.com) for your Zendesk support project.

Import `package:flutter_zendesk/flutter_zendesk.dart`, and initiate `Zendesk Support` with your credentials.

### Integration

```dart
      await FlutterZendesk.initiateZendesk(params: {
        "appId": "YOUR_APP_ID",
        "clientId": "CLIENT_ID",
        "url": "YOUR_URL",
      });
```

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.