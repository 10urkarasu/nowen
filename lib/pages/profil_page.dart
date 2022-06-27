import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:now_eng/pages/auth_pages/login_page.dart';
import 'package:now_eng/services/auth_service.dart';

import '../services/status_services.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  StatusService _statusService = StatusService();
  AuthService  _authService=AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(onPressed: () {
        _authService.signOut();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }, child: Text("EXİT")),
    );
  }}





