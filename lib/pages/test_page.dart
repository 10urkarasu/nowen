import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:now_eng/widgets/test_widget.dart';

import '../services/status_services.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  StatusService _statusService = StatusService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _statusService.getStatus(),
        builder: (context, snaphot) {
          return !snaphot.hasData
              ? CircularProgressIndicator()
              : TestWidget(doc:snaphot.data!.docs);
        });}}


