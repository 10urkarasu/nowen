import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({required this.doc,Key? key}) : super(key: key);
  final List<QueryDocumentSnapshot> doc;
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final TextEditingController _wordController = TextEditingController();
   int controller=0;
   int score=0;
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: CircleAvatar(
                  radius: 150,
                  backgroundColor: Colors.white70,
                  child: Image(
                    image: NetworkImage(widget.doc![controller]["photo"]),
                    height: 150,
                    width: 150,),
                ),
              ),
              Padding(padding:  EdgeInsets.all(5.0),
                child: Text(score.toString()),
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: _wordController,
                    obscureText: false,
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
              InkWell(
                onTap: () {
                  controller==widget.doc!.length-1
                      ?
                      controller
                      :
                  setState(() {
                    _wordController.text==widget.doc![controller]["english"]?
                    {
                      score++,
                      controller++
                    }
                        :
                    controller++;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      //color: colorPrimaryShade,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Center(
                        child: Text(
                          "OK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
