import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final TextEditingController _wordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: CircleAvatar(
                  radius: 150,
                  backgroundColor: Colors.white70,
                  child: Image(
                    image: AssetImage("lib/assets/canta.png"),
                    height: 150,
                    width: 150,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: _wordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.code,
                        color: Colors.white,
                      ),
                      hintText: 'Word',
                      prefixText: ' ',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      focusColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                    )),
              ),
              Container(
                height: 200,
                width: 200,
              )
            ],
          ),
    );
  }
}
