import 'package:flutter/material.dart';

final demoPlayList = new DemoPlayList(songs: [
  DemoSong(
      url : "http://indiespectrum.com:9000",
      albumArtUrl: "https://static1.squarespace.com/static/58b0b04d86e6c04706c13fa7/58dbf9bb2994ca7505dcd487/58dbf9fed482e96717c528ef/1490814973661/AllDead_RiseBelow_back.jpg?format=750w",
      title: "title",
      artist: "artist"),

]);

class DemoPlayList {
  List<DemoSong> songs;

  DemoPlayList({this.songs});
}

class DemoSong {
  String url;
  String albumArtUrl;
  String title;
  String artist;

  DemoSong({this.url, this.albumArtUrl, this.title, this.artist});
}
