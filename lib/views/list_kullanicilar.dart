import "package:flutter/material.dart";
import 'package:vizeodevi/main.dart';
import 'package:vizeodevi/models/Kullanici.dart';
import 'package:vizeodevi/services/db_utils.dart';
import 'package:vizeodevi/users/uyeler.dart';

DbUtils utils = DbUtils();

class ListKullanicilar extends StatefulWidget {
  @override
  _ListKullanicilarState createState() => _ListKullanicilarState();
}

class _ListKullanicilarState extends State<ListKullanicilar> {
  List<Kullanici> kullaniciList = [];

  void getData() async {
    await utils.kullanicilar().then((result) => {
          setState(() {
            kullaniciList = result;
          })
        });
    print(kullaniciList);
  }

  void showAlert(String alertTitle, String alertContent) {
    AlertDialog alertDialog;
    alertDialog =
        AlertDialog(title: Text(alertTitle), content: Text(alertContent));
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text(kullaniciList.length.toString() + " Kullanicilar Listesi")),
      body: SingleChildScrollView(
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
                    onTap: () {
                      showAlert("Kullanici " + index.toString() + " tıklandı",
                          "Kullanici " + index.toString() + " tıklandı");
                    },
                    onLongPress: () async {
                      await utils
                          .deleteDog(kullaniciList[index].telefon)
                          .then((value) => {
                                showAlert(
                                    "Kullanici " +
                                        index.toString() +
                                        " silindi",
                                    "Kullanici " +
                                        index.toString() +
                                        " silindi")
                              });
                      getData();
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => uyeler()),
                    );
                  },
                  child: Text("Üye Sayfasına Geri Dön")),
            ),
          ],
        ),
      ),
    );
  }
}
