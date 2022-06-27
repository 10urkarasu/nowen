import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/status_services.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  StatusService _statusService = StatusService();
  @override
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
                _statusService.copy(snaphot.data!.docs[index]["audio"], snaphot.data!.docs[index]["english"],
                    snaphot.data!.docs[index]["photo"], snaphot.data!.docs[index]["turkish"],
                    snaphot.data!.docs[index]["video"], snaphot.data!.docs[index]["status"]);
                return Text("1");
              }
          );
        });
  }}





