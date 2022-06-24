import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:now_eng/services/status_services.dart';
import 'package:video_player/video_player.dart';

class OgrenWidget extends StatefulWidget {
  const OgrenWidget({required this.doc,Key? key}) : super(key: key);
  final DocumentSnapshot doc;
  @override
  _OgrenWidgetState createState() => _OgrenWidgetState();
}

class _OgrenWidgetState extends State<OgrenWidget> {
  StatusService statusService=StatusService();
  late VideoPlayerController _controller;
  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                    : Container(),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                child: IconButton(
                  iconSize: 50,
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  icon: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: CircleAvatar(
                    radius: 125,
                    backgroundColor: Colors.white70,
                    child: Image(
                      image: AssetImage("lib/assets/canta.png"),
                      height: 100,
                      width: 100,),
                  ),
                ),
                Text(this.widget.doc["english"],
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 30,
                  ),
                ),
                Text("Sırt Çantası",
                  style: TextStyle(
                      color: Colors.white60,
                      fontSize: 20
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: IconButton(
                    onPressed: () {
                      audioPlayer.play("https://samplelib.com/lib/preview/mp3/sample-3s.mp3", isLocal: false);
                    },
                    icon: Icon(Icons.play_arrow_sharp, size: 50,),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    statusService.getStatus();
                  },
                  icon: Icon(Icons.play_arrow_sharp, size: 50,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

