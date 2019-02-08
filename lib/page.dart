import 'package:flutter/material.dart';
import 'package:sync_app/bottomcontrols.dart';
import 'package:sync_app/songs.dart';
import 'package:sync_app/theme.dart';
import 'package:fluttery_audio/fluttery_audio.dart';

//class MApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "Music player",
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(primarySwatch: Colors.blue),
//      home: Page(),
//    );
//  }
//
//}

class Page extends StatefulWidget {

  String audioUri;
  String albumArt;

  @override
  _PageState createState() => _PageState();

  Page(String audioUri, String albumArt)
  {
    this.audioUri = audioUri;
    this.albumArt = albumArt;
  }

}

class _PageState extends State<Page> {

  String audioUri;
  String albumArt;

  @override
  Page get widget => super.widget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioUri = widget.audioUri;
    albumArt = widget.albumArt;
  }

  @override
  Widget build(BuildContext context) {
    return Audio(
      audioUrl: audioUri,
      playbackState: PlaybackState.paused,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.green,
            onPressed: () {},
          ),
          title: Text(""),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.menu), onPressed: () {})
          ],
        ),
        body: Column(
          children: <Widget>[
            //seek bar
            Expanded(
              child: new Center(
                child: Container(
                  width: 125.0,
                  height: 125.0,
                  child: Image.network(
                    demoPlayList.songs[0].albumArtUrl,
                    fit : BoxFit.cover
                  ),
                ),
              ),
            ),

            //visualizer
            Container(
              width: double.infinity,
              height: 125.0,
            ),

            //title,artist etc
            new BottomControls()
          ],
        ),
      ),
    );
  }
}

