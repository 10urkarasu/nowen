import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:now_eng/models/kelime.dart';
import 'package:now_eng/services/auth_service.dart';


class StatusService {
  AuthService authService=AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //status eklemek için
  Future<Kelime> addStatus(Kelime kelime) async {
    var ref = _firestore.collection(authService.authInfo().toString());
    var documentRef = await ref.add({'status': kelime});
    return Kelime(audio: kelime.audio,english: kelime.english,photo: kelime.photo,turkish: kelime.turkish,video: kelime.video);
  }

  //status göstermek için
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("public").snapshots();
    return ref;
  }

  //status silmek için
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection(authService.authInfo().toString()).doc(docId).delete();

    return ref;
  }
}