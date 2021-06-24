import 'package:flutter/material.dart';

class oyuncak extends StatefulWidget {
  @override
  _oyuncakState createState() => _oyuncakState();
}

class _oyuncakState extends State<oyuncak> {
  String adi = '';
  int ManyetikAlfabeSetiNo = 1;
  int BebekNo = 1;
  int ArabaNo = 1;

  void _ManyetikAlfabeSetiNoDegistir() {
    setState(() {
      if (ManyetikAlfabeSetiNo < 3) {
        ManyetikAlfabeSetiNo++;
      }
      if (ManyetikAlfabeSetiNo == 3) {
        ManyetikAlfabeSetiNo = 1;
      }
    });
  }

  void _BebekNoDegistir() {
    setState(() {
      if (BebekNo < 6) {
        BebekNo++;
      }
      if (BebekNo == 6) {
        BebekNo = 1;
      }
    });
  }

  void _ArabaNoDegistir() {
    setState(() {
      if (ArabaNo < 5) {
        ArabaNo++;
      }
      if (ArabaNo == 5) {
        ArabaNo = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Oyuncak'),
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
                          'assets/images/ManyetikAlfabeSeti_$ManyetikAlfabeSetiNo.png'),
                    ),
                    onTap: () {
                      _ManyetikAlfabeSetiNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Manyetik Alfabe Seti"),
                        Text(
                          " 26,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Manyetik Alfabe Seti";
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
              color: Colors.yellow,
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
                        child: Image.asset('assets/images/Bebek_$BebekNo.png'),
                      ),
                    ),
                    onTap: () {
                      _BebekNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Bebek "),
                        Text(
                          " 139,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Bebek";
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
              color: Colors.yellow,
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
                      child: Image.asset('assets/images/Araba_$ArabaNo.png'),
                    ),
                    onTap: () {
                      _ArabaNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Araba"),
                        Text(
                          " 89,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Araba";
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
