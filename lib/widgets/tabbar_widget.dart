import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:now_eng/widgets/video_widget.dart';
import 'package:now_eng/widgets/word_widget.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({required this.doc,Key? key}) : super(key: key);
  final DocumentSnapshot doc;

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.photo_camera_back),
              ),
              Tab(
                icon: Icon(Icons.video_collection_outlined),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            WordWidget(doc:this.widget.doc),
            VideoWidget(doc:this.widget.doc),
          ],
        ),
      ),
    );
  }
}
