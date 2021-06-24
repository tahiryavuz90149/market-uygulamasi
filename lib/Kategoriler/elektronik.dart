import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class elektronik extends StatefulWidget {
  @override
  _elektronikState createState() => _elektronikState();
}

class _elektronikState extends State<elektronik> {
  String adi = '';
  int BilgisayarNo = 1;
  int TelefonNo = 1;

  void _BilgisayarNoDegistir() {
    setState(() {
      if (BilgisayarNo < 4) {
        BilgisayarNo++;
      }
      if (BilgisayarNo == 4) {
        BilgisayarNo = 1;
      }
    });
  }

  void _TelefonNoDegistir() {
    setState(() {
      if (TelefonNo < 3) {
        TelefonNo++;
      }
      if (TelefonNo == 3) {
        TelefonNo = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Elektronik'),
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
                      child: Image.asset(
                          'assets/images/Bilgisayar_$BilgisayarNo.png'),
                    ),
                    onTap: () {
                      _BilgisayarNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text("Lenovo IdeaPad Gaming"),
                          Text(
                            " 8.699,00 TL",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  adi = "Lenovo IdeaPad Gaming";
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
              color: Colors.green,
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
                          'assets/images/Telefon_$TelefonNo.png',
                        ),
                      ),
                    ),
                    onTap: () {
                      _TelefonNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text("Xiaomi redmi Note 9 Pro"),
                          Text(
                            " 3.699,00 TL",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  adi = "Xiaomi redmi Note 9 Pro";
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
          ],
        ),
      ),
    );
  }
}
