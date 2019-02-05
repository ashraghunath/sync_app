import 'package:flutter/material.dart';
import 'package:sync_app/songs.dart';
import 'package:sync_app/theme.dart';

class MApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music player",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Page(),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            color: accentColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
              child: Column(
                children: <Widget>[
                  //for texts above the button row
                  RichText(
                    text: TextSpan(text: '', children: [
                      TextSpan(
                          text: "Song title\n",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0,
                            height: 1.5,
                          )),
                      TextSpan(
                          text: "Artist name",
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: 12.0,
                              letterSpacing: 3.0,
                              height: 1.5))
                    ]),
                  ),

                  //row for buttons
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Container()),
                        IconButton(
                          icon: Icon(Icons.skip_previous),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 35.0,
                        ),
                        Expanded(child: Container()),
                        RawMaterialButton(
                          shape: CircleBorder(),
                          fillColor: Colors.white,
                          splashColor: lightAccentColor,
                          highlightColor: lightAccentColor.withOpacity(0.5),
                          elevation: 10.0,
                          highlightElevation: 5.0,
                          onPressed: () {},
                          child: Padding(padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.play_arrow,
                            color: darkAccentColor,
                            size: 35.0,
                          ),),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                          icon: Icon(Icons.skip_next),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 35.0,
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
