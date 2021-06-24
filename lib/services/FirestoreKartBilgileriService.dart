import 'package:vizeodevi/models/kart_modeli.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreKartBilgileriService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveKartBilgileri(kartBilgileri kartbilgileri) {
    return _db
        .collection('kartbilgileri')
        .doc(kartbilgileri.iban)
        .set(kartbilgileri.toMap());
  }

  Stream<List<kartBilgileri>> getKartBilgileri() {
    return _db.collection('kartBilgileri').snapshots().map((snapshot) =>
        snapshot.docs
            .map((document) => kartBilgileri.fromFirestore(document.data()))
            .toList());
  }

  Future<void> removeProduct(String id) {
    return _db.collection('kartBilgileri').doc(id).delete();
  }
}
