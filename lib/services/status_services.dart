import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:now_eng/models/kelime.dart';
import 'package:now_eng/services/auth_service.dart';


class StatusService {
  AuthService authService=AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<Kelime> addStatus(Kelime kelime) async {
    var ref = _firestore.collection(authService.authInfo().toString());
    return Kelime(audio: kelime.audio,english: kelime.english,photo: kelime.photo,turkish: kelime.turkish,video: kelime.video,status: kelime.status);
  }

  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("public").snapshots();
    return ref;
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> controllStatus() {
    var ref = _firestore.collection(authService.authInfo().toString()).snapshots();
    return ref;
  }


  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection(authService.authInfo().toString()).doc(docId).delete();
    return ref;
  }

  void copy(String audio,String english,String photo,String turkish,String video,String status) {
    _firestore.collection(authService.authInfo().toString()).add({
      "audio": audio,
      "english": english,
      "photo": photo,
      "turkish": turkish,
      "video": video,
      "status": status,
    }).then((_){
      print("collection created");
    }).catchError((_){
      print("an error occured");
    });
  }

}