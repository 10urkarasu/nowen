import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:now_eng/pages/auth_pages/login_page.dart';

import '../../services/status_services.dart';
import '../../widgets/my_navigate_bar.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key? key}) : super(key: key);

  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  StatusService _statusService = StatusService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _statusService.controllStatus()==null
          ?
      StreamBuilder<QuerySnapshot>(
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
                  return index==snaphot.data!.docs.length-1
                    ?
                  TextButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyNavigateBar()),
                    );
                  }, child: Text("Devam Et"))
                      :
                  Text(".");
                }
            );
          })
          :
          TextButton(onPressed: () {
            print(_statusService.controllStatus().toString());
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyNavigateBar()),
            );
          }, child: Text("Devam Et"))
    );
  }
}
