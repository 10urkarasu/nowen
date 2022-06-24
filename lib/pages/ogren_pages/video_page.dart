import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../services/status_services.dart';
import '../../widgets/ogren_widget.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  StatusService _statusService = StatusService();
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _statusService.getStatus(),
    builder: (context, snaphot) {
    return !snaphot.hasData
    ? CircularProgressIndicator()
        : ListView.builder(
    itemCount: snaphot.data!.docs.length,
    itemBuilder: (context, index) {
    DocumentSnapshot mypost = snaphot.data!.docs[index];
    return OgrenWidget(doc:mypost);
    }
    );});}}

