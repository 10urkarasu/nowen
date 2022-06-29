import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:now_eng/pages/auth_pages/login_page.dart';
import 'package:now_eng/services/auth_service.dart';

import '../services/status_services.dart';
import '../widgets/info_card.dart';

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
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
              Text(
                _authService.authGetInfo()[1],
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              InfoCard(text: _authService.authGetInfo()[1], icon: Icons.drive_file_rename_outline, onPressed: () async {}),
              InfoCard(text: _authService.authGetInfo()[2], icon: Icons.phone, onPressed: () async {}),
              InfoCard(text: _authService.authGetInfo()[0], icon: Icons.email, onPressed: () async {}),
            ],
          ),
        ));
  }}





