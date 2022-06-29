import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../services/status_services.dart';
import '../../widgets/tabbar_widget.dart';

class OgrenPage extends StatefulWidget {
  const OgrenPage({Key? key}) : super(key: key);

  @override
  _OgrenPageState createState() => _OgrenPageState();
}

class _OgrenPageState extends State<OgrenPage> {
  StatusService _statusService = StatusService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _statusService.getStatus(),
        builder: (context, snaphot) {
          return !snaphot.hasData
              ? CircularProgressIndicator()
              : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snaphot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot mypost = snaphot.data!.docs[index];
                return TabBarWidget(doc: mypost);
              });
        });
  }
}

