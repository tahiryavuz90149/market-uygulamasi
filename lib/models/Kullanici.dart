class Kullanici {
  final String adi;
  final String adres;
  final int telefon;

  Kullanici({this.adi, this.adres, this.telefon});

  Map<String, dynamic> toMap() {
    return {
      'adi': adi,
      'adres': adres,
      'telefon': telefon,
    };
  }

  @override
  String toString() {
    return 'Kullanici{adi: $adi, adres: $adres, telefon: $telefon}';
  }
}
