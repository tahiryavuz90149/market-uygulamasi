import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class giyim extends StatefulWidget {
  @override
  _giyimState createState() => _giyimState();
}

class _giyimState extends State<giyim> {
  String adi = '';
  int TisortNo = 1;
  int TakimElbiseNo = 1;
  int Tisort2No = 1;

  void _TisortNoDegistir() {
    setState(() {
      if (TisortNo < 5) {
        TisortNo++;
      }
      if (TisortNo == 5) {
        TisortNo = 1;
      }
    });
  }

  void _Tisort2NoDegistir() {
    setState(() {
      if (Tisort2No < 4) {
        Tisort2No++;
      }
      if (Tisort2No == 4) {
        Tisort2No = 1;
      }
    });
  }

  void _TakimElbiseNoDegistir() {
    setState(() {
      if (TakimElbiseNo < 5) {
        TakimElbiseNo++;
      }
      if (TakimElbiseNo == 5) {
        TakimElbiseNo = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Giyim'),
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
                      child: Image.asset('assets/images/Tisort_$TisortNo.png'),
                    ),
                    onTap: () {
                      _TisortNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text("Altın Yıldız Düğmeli Polo Yaka Gri"),
                          Text(
                            " 64,99 TL",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  adi = "Altın Yıldız Düğmeli Polo Yaka Gri";
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
              color: Colors.pinkAccent,
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
                        child:
                            Image.asset('assets/images/Tisort2_$Tisort2No.png'),
                      ),
                    ),
                    onTap: () {
                      _Tisort2NoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Expanded(
                      child: Column(
                        children: [
                          Text("Altın Yıldız Düğmeli Polo Yaka Siyah "),
                          Text(
                            " 64,99 TL",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  adi = "Altın Yıldız Düğmeli Polo Yaka Siyah";
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
              color: Colors.pinkAccent,
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
                      child: Image.asset(
                          'assets/images/TakimElbise_$TakimElbiseNo.png'),
                    ),
                    onTap: () {
                      _TakimElbiseNoDegistir();
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Altın Yıldız Classic Takım Elbise"),
                        Text(
                          " 279,99 TL",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                adi = "Altın Yıldız Classic Takım Elbise";
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
