import 'package:flutter/material.dart';

class kirtasiyeUrunleri extends StatefulWidget {
  @override
  _kirtasiyeUrunleriState createState() => _kirtasiyeUrunleriState();
}

class _kirtasiyeUrunleriState extends State<kirtasiyeUrunleri> {
  String adi = '';
  int BoyaNo = 1;
  int ErkekCantaNo = 1;
  int KizCantaNo = 1;
  int KalemlikNo = 1;

  void _BoyaNoDegistir() {
    setState(() {
      if (BoyaNo < 5) {
        BoyaNo++;
      }
      if (BoyaNo == 5) {
        BoyaNo = 1;
      }
    });
  }

  void _ErkekCantaNoDegistir() {
    setState(() {
      if (ErkekCantaNo < 4) {
        ErkekCantaNo++;
      }
      if (ErkekCantaNo == 4) {
        ErkekCantaNo = 1;
      }
    });
  }

  void _KizCantaNoDegistir() {
    setState(() {
      if (KizCantaNo < 4) {
        KizCantaNo++;
      }
      if (KizCantaNo == 4) {
        KizCantaNo = 1;
      }
    });
  }

  void _KalemlikNoDegistir() {
    setState(() {
      if (KalemlikNo < 5) {
        KalemlikNo++;
      }
      if (KalemlikNo == 5) {
        KalemlikNo = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Kırtasiye Malzemeleri'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 220,
                      child: Image.asset('assets/images/BoyaSeti_$BoyaNo.jpg'),
                    ),
                    onTap: () {
                      _BoyaNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text("Ahşap Çantalı Boya Seti"),
                          Text(
                            " 95,00 TL",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  adi = "Ahşap Çantalı Boya Seti";
                                  print("$adi isimli ürün sepete eklendi.");
                                },
                                child: Text('Sepete Ekle'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              //aradaki turuncu çizgiyi oluşturuyor
              color: Colors.red,
              height: 0.1, // divider yüksekliği
              thickness: 5, // divider ın kalınlığı
              indent: 5, // divider ın kenarlardaki boşluğu
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 220,
                        child: Image.asset(
                            'assets/images/ErkekCanta_$ErkekCantaNo.jpg'),
                      ),
                    ),
                    onTap: () {
                      _ErkekCantaNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text("Kral Şakir Lacivert Anaokul Çantası"),
                          Text(
                            " 135,00 TL",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  adi = "Kral Şakir Lacivert Anaokul Çantası";
                                  print("$adi isimli ürün sepete eklendi.");
                                },
                                child: Text('Sepete Ekle'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              //aradaki turuncu çizgiyi oluşturuyor
              color: Colors.red,
              height: 0.1, // divider yüksekliği
              thickness: 5, // divider ın kalınlığı
              indent: 5, // divider ın kenarlardaki boşluğu
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 220,
                      child:
                          Image.asset('assets/images/Kalemlik_$KalemlikNo.jpg'),
                    ),
                    onTap: () {
                      _KalemlikNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Deri Kalemlik"),
                        Text(
                          " 249,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Deri Kalemlik";
                                print("$adi isimli ürün sepete eklendi.");
                              },
                              child: Text('Sepete Ekle'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              //aradaki turuncu çizgiyi oluşturuyor
              color: Colors.red,
              height: 0.1, // divider yüksekliği
              thickness: 5, // divider ın kalınlığı
              indent: 5, // divider ın kenarlardaki boşluğu
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 220,
                      child:
                          Image.asset('assets/images/KizCanta_$KizCantaNo.jpg'),
                    ),
                    onTap: () {
                      _KizCantaNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Frozen Okul Çanta Seti"),
                        Text(
                          " 179,00 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Frozen Okul Çanta Seti";
                                print("$adi isimli ürün sepete eklendi.");
                              },
                              child: Text('Sepete Ekle'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
