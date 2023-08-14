import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:audioplayers/audioplayers.dart'; // Add this dependency in your pubspec.yaml

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FM Radio Station',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RadioPlayerPage(),
    );
  }
}

class RadioPlayerPage extends StatefulWidget {
  @override
  _RadioPlayerPageState createState() => _RadioPlayerPageState();
}

class _RadioPlayerPageState extends State<RadioPlayerPage> {
  AudioPlayer audioPlayer = AudioPlayer();

  String radioUrl =
      'http://ice1.somafm.com/groovesalad-128-mp3'; // SomaFM Groove Salad
  // Replace with your radio stream URL

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playRadio() async {}

  void stopRadio() async {
    await audioPlayer.stop();
    print('Radio stopped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FM Radio Station'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: playRadio,
              child: Text('Play Radio'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: stopRadio,
              child: Text('Stop Radio'),
            ),
          ],
        ),
      ),
    );
  }
}
