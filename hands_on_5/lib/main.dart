import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MaterialApp(home: SimpleAudioPlayerApp()));
}

class SimpleAudioPlayerApp extends StatefulWidget {
  const SimpleAudioPlayerApp({Key? key}) : super(key: key);

  @override
  _SimpleAudioPlayerAppState createState() => _SimpleAudioPlayerAppState();
}

class _SimpleAudioPlayerAppState extends State<SimpleAudioPlayerApp> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  Future<void> _playAudio() async {
    await _audioPlayer.setSource(AssetSource('assets/iphone.mp3'));
    await _audioPlayer.resume();
    setState(() => _isPlaying = true);
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() => _isPlaying = false);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Player')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 64,
              onPressed: _isPlaying ? _pauseAudio : _playAudio,
            ),
            const Text("Tap to play or pause audio"),
          ],
        ),
      ),
    );
  }
}
