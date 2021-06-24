import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vizeodevi/models/kart_modeli.dart';
import 'kartBilgiGir.dart';

class kartgiris extends StatefulWidget {
  String kartSahibi = "";
  String iban = "";

  @override
  _kartgirisState createState() => _kartgirisState();
}

class _kartgirisState extends State<kartgiris> {
  @override
  Widget build(BuildContext context) {
    final domainfirms = Provider.of<List<kartBilgileri>>(context);

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('kart Bilgilerinizi girin.'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => kartBilgiGir()));
            },
          )
        ],
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                size: 40,
                color: Colors.black,
              ),
              color: Colors.black,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
      ),
      body: (domainfirms != null)
          ? ListView.builder(
              itemCount: domainfirms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.beach_access,
                    color: Colors.blue,
                    size: 36.0,
                  ),
                  title: Text(domainfirms[index].kartSahibi),
                  subtitle: Text(domainfirms[index].iban),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            kartBilgiGir(domainfirms[index])));
                  },
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
