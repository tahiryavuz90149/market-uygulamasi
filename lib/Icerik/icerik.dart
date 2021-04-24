import 'package:flutter/material.dart';
import 'package:vizeodevi/Kategoriler/beyazEsya.dart';
import 'package:vizeodevi/Kategoriler/elektronik.dart';
import 'package:vizeodevi/Kategoriler/giyim.dart';
import 'package:vizeodevi/Kategoriler/h%C4%B1rdavat.dart';
import 'package:vizeodevi/Kategoriler/icecekler.dart';
import 'package:vizeodevi/Kategoriler/k%C4%B1rtasiyeUrunleri.dart';
import 'package:vizeodevi/Kategoriler/oyuncak.dart';

class icerik extends StatefulWidget {
  @override
  _icerikState createState() => _icerikState();
}

class _icerikState extends State<icerik> {
  @override
  Widget build(BuildContext context) {
    var adSoyad = ModalRoute.of(context)
        .settings
        .arguments; //main sayfasında girilen ismi içerik sayfasna alıyor.
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(
            'Sayın ' + adSoyad + ' Şuan içerik sayfasını görüntülemektesiniz'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    color: Colors.red,
                    child: FlatButton(
                      child: ListTile(
                        title: Text('Kırtasiye Ürünleri'),
                        leading: Icon(Icons.content_cut), // makas ikonu
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => kirtasiyeUrunleri()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    color: Colors.indigoAccent,
                    child: FlatButton(
                      child: ListTile(
                        title: Text('Beyaz Eşya'),
                        leading: Icon(Icons.credit_card), // kahve ikonu
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => beyazEsya()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    color: Colors.cyanAccent,
                    child: FlatButton(
                      child: ListTile(
                        title: Text('İçecekler'),
                        leading: Icon(Icons.free_breakfast), // kahve ikonu
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => icecekler()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    color: Colors.pinkAccent,
                    child: FlatButton(
                      child: ListTile(
                        title: Text('Giyim'),
                        leading: Icon(Icons.face),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => giyim()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    color: Colors.green,
                    child: FlatButton(
                      child: ListTile(
                        title: Text('Elektronik'),
                        leading: Icon(Icons.computer), // bilgisayar ikonu
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => elektronik()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    color: Colors.blue,
                    child: FlatButton(
                      child: ListTile(
                        title: Text('Hırdavat'),
                        leading: Icon(Icons.build), // anahtar ikonu
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => hirdavat()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    color: Colors.yellow,
                    child: FlatButton(
                      child: ListTile(
                        title: Text('Oyuncak'),
                        leading: Icon(Icons.extension), // yapboz ikonu
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => oyuncak()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Anasayfaya Dön'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
