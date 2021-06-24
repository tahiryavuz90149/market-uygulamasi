import 'package:flutter/material.dart';

class hirdavat extends StatefulWidget {
  @override
  _hirdavatState createState() => _hirdavatState();
}

class _hirdavatState extends State<hirdavat> {
  String adi = '';
  int YapistiriciNo = 1;
  int VidaveDubelSetiNo = 1;
  int BantNo = 1;

  void _YapistiriciNoDegistir() {
    setState(() {
      if (YapistiriciNo < 4) {
        YapistiriciNo++;
      }
      if (YapistiriciNo == 4) {
        YapistiriciNo = 1;
      }
    });
  }

  void _VidaveDubelSetiNoDegistir() {
    setState(() {
      if (VidaveDubelSetiNo < 4) {
        VidaveDubelSetiNo++;
      }
      if (VidaveDubelSetiNo == 4) {
        VidaveDubelSetiNo = 1;
      }
    });
  }

  void _BantNoDegistir() {
    setState(() {
      if (BantNo < 4) {
        BantNo++;
      }
      if (BantNo == 4) {
        BantNo = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Hırdavat'),
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
                          'assets/images/Yapistirici_$YapistiriciNo.png'),
                    ),
                    onTap: () {
                      _YapistiriciNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Yapıştırıcı"),
                        Text(
                          " 18,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Yapıştırıcı";
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
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 220,
                        child: Image.asset(
                            'assets/images/VidaveDubelSeti_$VidaveDubelSetiNo.png'),
                      ),
                    ),
                    onTap: () {
                      _VidaveDubelSetiNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Vida ve Dübel Seti "),
                        Text(
                          " 39,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Vida ve Dübel Seti";
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
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 220,
                      child: Image.asset('assets/images/Bant_$BantNo.png'),
                    ),
                    onTap: () {
                      _BantNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Bant"),
                        Text(
                          " 14,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Bant";
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
          ],
        ),
      ),
    );
  }
}
