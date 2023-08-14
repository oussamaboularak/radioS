import 'package:flutter/material.dart';
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

  String radioUrl = 'https://ok.ru/video/6957785947773'; // SomaFM Groove Salad
  // Replace with your radio stream URL

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playRadio() async {
    await audioPlayer.play(UrlSource(radioUrl));
  }

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
