import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';
import 'package:sync_app/theme.dart';
enum PlayerState { stopped, playing, paused }
class BottomControls extends StatelessWidget {

  const BottomControls({
    Key key,
    String audioUrl
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: accentColor,
      child: Material(
        color: accentColor,
        shadowColor: const Color(0x44000000),
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

                    new PreviousButton(),

                    Expanded(child: Container()),

                    new PlayPauseButton(),

                    Expanded(child: Container()),

                    new NextButton(),

                    Expanded(child: Container()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key key,
  }) : super(key: key);

  void onPressed(AudioPlayer audioPlayer, IconData icon)
  {

  }

  @override
  Widget build(BuildContext context) {
    return AudioComponent(
      updateMe: [
        WatchableAudioProperties.audioPlayerState
      ],
      playerBuilder: (BuildContext context, AudioPlayer audioPlayer, Widget child){
        IconData icon = Icons.play_arrow;
        Function onPressed;
        if(audioPlayer.state == AudioPlayerState.playing)
        {
          icon = Icons.pause;
          onPressed = audioPlayer.pause;
        } else if(audioPlayer.state == AudioPlayerState.paused || audioPlayer.state == AudioPlayerState.completed)
        {
          icon = Icons.play_arrow;
          onPressed= audioPlayer.play;
        }


        return RawMaterialButton(
          shape: CircleBorder(),
          fillColor: Colors.white,
          splashColor: lightAccentColor,
          highlightColor: lightAccentColor.withOpacity(0.5),
          elevation: 10.0,
          highlightElevation: 5.0,
          onPressed: onPressed,
          child: Padding(padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: darkAccentColor,
              size: 35.0,
            ),),
        );
      },
    );
  }
}

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: lightAccentColor,
      highlightColor: Colors.transparent,
      icon: Icon(Icons.skip_previous),
      onPressed: () {},
      color: Colors.white,
      iconSize: 35.0,
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: lightAccentColor,
      highlightColor: Colors.transparent,
      icon: Icon(Icons.skip_next),
      onPressed: () {},
      color: Colors.white,
      iconSize: 35.0,
    );
  }
}
