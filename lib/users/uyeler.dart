import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vizeodevi/auth/auth_methods.dart';
import 'package:vizeodevi/kart/kartBilgiGir.dart';
import 'package:vizeodevi/models/Kullanici.dart';
import 'package:vizeodevi/services/FirestoreKartBilgileriService.dart';
import 'package:vizeodevi/views/list_kullanicilar.dart';
import 'package:vizeodevi/services/db_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vizeodevi/general/general_methods.dart';
import 'package:provider/provider.dart';
import 'package:vizeodevi/kart/kartgiris.dart';
import 'package:vizeodevi/Grafik/LineChartSample1.dart';
import 'package:vizeodevi/Tesekkur/Tesekkurler.dart';

DbUtils utils = DbUtils();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hemen Üye Ol',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: uyeler(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class uyeler extends StatefulWidget {
  @override
  _uyelerState createState() => _uyelerState();
}

class _uyelerState extends State<uyeler> {
  String user_adi = "";
  String user_adres = "";
  String user_telefon = "";

  TextEditingController kullaniciAdiController = TextEditingController();
  TextEditingController kullaniciAdresiController = TextEditingController();
  TextEditingController kullanicitelefonuController = TextEditingController();

  Future<Database> database;

  List<Kullanici> kullaniciList = [];

  _onPressedUpdate() async {
    final sahip = Kullanici(
      adi: kullaniciAdiController.text,
      adres: kullaniciAdresiController.text,
      telefon: int.parse(kullanicitelefonuController.text),
    );
    utils.updateDog(sahip);
    kullaniciList = await utils.kullanicilar();
    getData();
  }

  _onPressedAdd() async {
    final sahip = Kullanici(
      adi: kullaniciAdiController.text,
      adres: kullaniciAdresiController.text,
      telefon: int.parse(kullanicitelefonuController.text),
    );
    utils.insertDog(sahip);
    kullaniciList = await utils.kullanicilar();

    getData();
  }

  _deleteUyeTable() {
    utils.deleteTable();
    kullaniciList = [];
    getData();
  }

  void getData() async {
    await utils.kullanicilar().then((result) => {
          setState(() {
            kullaniciList = result;
          })
        });
    print(kullaniciList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    //final firebaseUser = context.watch<User>();

    return MaterialApp(
      title: 'Kullanicilar',
      home: Scaffold(
        appBar: AppBar(title: Text('Hemen Üye Ol')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    user_adi = value;
                  },
                  controller: kullaniciAdiController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Kullanıcı Adını Giriniz'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    user_adres = value;
                  },
                  controller: kullaniciAdresiController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Adresini Giriniz'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    user_telefon = value;
                  },
                  controller: kullanicitelefonuController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Telefonunuzu Giriniz'),
                ),
              ),
              Container(
                color: Colors.yellowAccent,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: _onPressedAdd,
                              child: Text("Kullanıcıyı Ekle")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: _onPressedUpdate,
                              child: Text("Kullanıcıyı Güncelle")),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: _deleteUyeTable,
                              child: Text("Kullanıcı Tablosunu sil")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListKullanicilar()),
                                );
                              },
                              child: Text("Kullanıcı Listesi")),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                getData();
                              },
                              child: Text("Listeyi Yenile")),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<FlutterFireAuthService>()
                                        .createAccount(
                                            user_adi, user_adres, user_telefon);
                                  },
                                  child: Text("Kayıt Ol")),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.green,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => kartgiris()),
                                    );
                                  },
                                  child: Text("kart bilgilerini gir")),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.green,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LineChartSample1()),
                                    );
                                  },
                                  child: Text(
                                      "Kullanıcıların Kayıt Olma İstatislikleri")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tesekkurler()),
                      );
                    },
                    child: Text("Teşekkürler")),
              ),
              Text(kullaniciList.length.toString()),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: kullaniciList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(kullaniciList[index].adi),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
