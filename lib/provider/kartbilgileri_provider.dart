import 'package:flutter/material.dart';
import 'package:vizeodevi/models/kart_modeli.dart';
import 'package:vizeodevi/services/FirestoreKartBilgileriService.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

class kartbilgileri_provider with ChangeNotifier {
  final firestoreService = FirestoreKartBilgileriService();
  String _iban;
  String _kartSahibi;

  var uuid = Uuid();

  String get iban => _iban;

  String get kartSahibi => _kartSahibi;

  changekartSahibi(String value) {
    _kartSahibi = value;
    notifyListeners();
  }

  changeiban(String value) {
    _iban = value;
    notifyListeners();
  }

  loadValues(kartBilgileri kartbilgileri) {
    _iban = kartbilgileri.iban;
    _kartSahibi = kartbilgileri.kartSahibi;
  }

  saveProduct() {
    print(_iban);
    if (_iban == null) {
      var newKartBilgileri = kartBilgileri(
        iban: uuid.v4(),
        kartSahibi: kartSahibi,
      );
      firestoreService.saveKartBilgileri(newKartBilgileri);
    } else {
      //Update
      var updatedKartBilgileri = kartBilgileri(
        iban: iban,
        kartSahibi: kartSahibi,
      );
      firestoreService.saveKartBilgileri(updatedKartBilgileri);
    }
  }

  removeProduct(String id) {
    firestoreService.removeProduct(id);
  }
}
