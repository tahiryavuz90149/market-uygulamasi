import 'package:flutter/material.dart';

class icecekler extends StatefulWidget {
  @override
  _iceceklerState createState() => _iceceklerState();
}

class _iceceklerState extends State<icecekler> {
  String adi = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text('İçecek'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    child: Card(
                      child:
                          Image.asset('assets/images/KarisikMeyveNektari.png'),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Karışık Meyve Nektarı"),
                        Text(
                          " 12,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Karışık Meyve Nektarı";
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
              color: Colors.cyanAccent,
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
                      child: Card(
                        child: Image.asset('assets/images/JussTea.png'),
                      ),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Juss Tea "),
                        Text(
                          " 7,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Juss Tea";
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
              color: Colors.cyanAccent,
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
                    child: Card(
                      child: Image.asset('assets/images/ElmaSuyu.png'),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Elma Suyu"),
                        Text(
                          " 14,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Elma Suyu";
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
