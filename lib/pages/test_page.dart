import 'package:flutter/material.dart';
import 'package:now_eng/widgets/test_widget.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TestWidget(),
        TestWidget(),
      ],
    );
  }
}
