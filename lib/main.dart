import 'package:flutter/material.dart';
import 'package:now_eng/pages/auth_pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:now_eng/screens/wrapper.dart';
import 'widgets/my_navigate_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
      ),
      home: LoginPage(),
    );
  }
}
