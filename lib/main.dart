import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';

void main() => runApp(MyApp());

enum PlayerState { stopped, playing, paused }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get isPlaying => playerState == PlayerState.playing;
  get isStopped => playerState == PlayerState.stopped;
  PlayerState playerState = PlayerState.stopped;
  List _songs;
  MusicFinder audioPlayer;
  bool songsGot = false;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() async {
    audioPlayer = new MusicFinder();
    var songs = await MusicFinder.allSongs();
    songsGot = true;
    songs = new List.from(songs);

    setState(() {
      _songs = songs;
    });
  }

  Future pause() async {
    final result = await audioPlayer.pause();
    if (result == 1) setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    final result = await audioPlayer.stop();
    if (result == 1)
      setState(() {
        playerState = PlayerState.stopped;
      });
  }

  void action(String url)
  {
    isPlaying? stop() : _playLocal(url);
  }

  Future _playLocal(String url) async {
    final result = await audioPlayer.play(url, isLocal: true);
    if (result == 1) setState(() => playerState = PlayerState.playing);
  }

  @override
  Widget build(BuildContext context) {
    Widget home() {
      return new Scaffold(
        appBar: AppBar(
          title: Text("Player"),
        ),
        body: songsGot? ListView.builder(
          itemCount: _songs.length,
          itemBuilder: (context, int index)
          {
            return ListTile(
              leading: new CircleAvatar(
                child: Text(_songs[index].title[0]),
              ),
              title: Text(_songs[index].title[0]),
              onTap: () => action(_songs[index].uri),
            );
          },
        ) : CircularProgressIndicator(),
      );
    }

    return MaterialApp(
      home: home(),
    );
  }
}
