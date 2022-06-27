import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WordWidget extends StatefulWidget {
  const WordWidget({required this.doc,Key? key}) : super(key: key);
  final DocumentSnapshot doc;

  @override
  _WordWidgetState createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> {
  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: CircleAvatar(
              radius: 125,
              backgroundColor: Colors.white70,
              child: Image(
                image: NetworkImage(this.widget.doc["photo"]),
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
          Text(this.widget.doc["turkish"],
            style: TextStyle(
                color: Colors.white60,
                fontSize: 20
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: IconButton(
              onPressed: () {
                audioPlayer.play(this.widget.doc["audio"], isLocal: false);
              },
              icon: Icon(Icons.play_arrow_sharp, size: 50,),
            ),
          ),
          /*IconButton(
                  onPressed: () {
                    statusService.getStatus();
                  },
                  icon: Icon(Icons.play_arrow_sharp, size: 50,),
                ),*/
        ],
      )
    );
  }
}
