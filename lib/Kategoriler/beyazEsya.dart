import 'package:flutter/material.dart';

class beyazEsya extends StatefulWidget {
  @override
  _beyazEsyaState createState() => _beyazEsyaState();
}

class _beyazEsyaState extends State<beyazEsya> {
  String adi = '';
  int BuzDolabiNo = 1;
  int BuzDolabi2No = 1;
  int CamasirMakinasiNo = 1;

  void _BuzDolabiNoDegistir() {
    setState(() {
      if (BuzDolabiNo < 4) {
        BuzDolabiNo++;
      }
      if (BuzDolabiNo == 4) {
        BuzDolabiNo = 1;
      }
    });
  }

  void _BuzDolabi2NoDegistir() {
    setState(() {
      if (BuzDolabi2No < 6) {
        BuzDolabi2No++;
      }
      if (BuzDolabi2No == 6) {
        BuzDolabi2No = 1;
      }
    });
  }

  void _CamasirMakinasiNoDegistir() {
    setState(() {
      if (CamasirMakinasiNo < 5) {
        CamasirMakinasiNo++;
      }
      if (CamasirMakinasiNo == 5) {
        CamasirMakinasiNo = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Beyaz Eşya'),
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
                          'assets/images/BuzDolabi_$BuzDolabiNo.png'),
                    ),
                    onTap: () {
                      _BuzDolabiNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text("Samsung No-Frost Buz Dolabı"),
                          Text(
                            " 3.795,92 TL",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  adi = "Samsung No-Frost Buz Dolabı";
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
              color: Colors.blue,
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
                            'assets/images/BuzDolabi2_$BuzDolabi2No.png'),
                      ),
                    ),
                    onTap: () {
                      _BuzDolabi2NoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text("Samsung A++ No-Frost Buz Dolabı"),
                          Text(
                            " 14.146,00 TL",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  adi = "Samsung A++ No-Frost Buz Dolabı";
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
              color: Colors.blue,
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
                      child: Image.asset(
                          'assets/images/CamasirMakinasi_$CamasirMakinasiNo.png'),
                    ),
                    onTap: () {
                      _CamasirMakinasiNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Çamaşır makinası"),
                        Text(
                          " 2.899,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Çamaşır makinası";
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
              color: Colors.blue,
              height: 0.1, // divider yüksekliği
              thickness: 5, // divider ın kalınlığı
              indent: 5, // divider ın kenarlardaki boşluğu
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
