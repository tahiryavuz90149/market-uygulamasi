class kartBilgileri {
  final String kartSahibi;
  final String iban;

  kartBilgileri({this.kartSahibi, this.iban});

  Map<String, dynamic> toMap() {
    return {
      'kartSahibi': kartSahibi,
      'iban': iban,
    };
  }

  kartBilgileri.fromFirestore(Map<String, dynamic> firestore)
      : kartSahibi = firestore['kartSahibi'],
        iban = firestore['iban'];
}
