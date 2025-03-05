import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:no_screenshot/no_screenshot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webassessor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Project Mobilis POC v1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Stream<KioskMode> _currentMode = watchKioskMode();
  final _noScreenshot = NoScreenshot.instance;

  void _showSnackBar(String message) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message)));

  void _handleStart(bool didStart) async {
    if (!didStart && Platform.isIOS) {
      _showSnackBar(_unsupportedMessage);
    }
    await _noScreenshot.screenshotOff();
  }

  void _handleStop(bool? didStop) async {
    if (didStop == false) {
      _showSnackBar(
        'Kiosk mode could not be stopped or was not active to begin with.',
      );
    }
    await _noScreenshot.screenshotOn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: StreamBuilder<KioskMode>(
          stream: _currentMode,
          builder: (context, snapshot) {
            final mode = snapshot.data;
            final message =
                mode == null
                    ? 'Can\'t determine the mode'
                    : 'Current mode: $mode';

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: switch (mode) {
                    null || KioskMode.enabled => null,
                    KioskMode.disabled =>
                      () => startKioskMode().then(_handleStart),
                  },
                  child: const Text('Lock APP (Kiosk Mode)'),
                ),
                MaterialButton(
                  onPressed: switch (mode) {
                    null || KioskMode.disabled => null,
                    KioskMode.enabled =>
                      () => stopKioskMode().then(_handleStop),
                  },
                  child: const Text('Unlock APP'),
                ),
                /*MaterialButton(
                  onPressed: () => isManagedKiosk()
                      .then((isManaged) => 'Kiosk is managed: $isManaged')
                      .then(_showSnackBar),
                  child: const Text('Check if managed'),
                ),
                MaterialButton(
                  onPressed: () => getKioskMode()
                      .then((mode) => 'Kiosk mode: $mode')
                      .then(_showSnackBar),
                  child: const Text('Check mode'),
                ),
                Text(message),*/
              ],
            );
          },
        ),
      ),
    );
  }
}

const _unsupportedMessage = '''
Single App mode is supported only for devices that are supervised 
using Mobile Device Management (MDM) and the app itself must 
be enabled for this mode by MDM.
''';
