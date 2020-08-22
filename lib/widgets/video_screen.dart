import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../chewieplayer.dart';

class MyHomePage extends StatelessWidget {
  final String url;
  final String img;
  final String dec;

  MyHomePage(this.url,this.img,this.dec);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          Spacer(),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              url,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
