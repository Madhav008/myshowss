import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../chewieplayer.dart';

class MyHomePage extends StatelessWidget {
  final String url;
  final String img;
  final String dec;
  final String name;

  MyHomePage(this.url, this.img, this.dec, this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name),
      ),
      body: ListView(
        children: <Widget>[
          Container(
             width: MediaQuery.of(context).size.width,
                    height: 220.0,
              
            decoration: BoxDecoration(
              
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(img),
              ),
            ),
          ),
          Container(
            child: ChewieListItem(
              videoPlayerController: VideoPlayerController.network(
                url,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              child: Text(dec,style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),)
            ),
          )
        ],
      ),
    );
  }
}
