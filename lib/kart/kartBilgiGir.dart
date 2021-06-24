import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vizeodevi/models/kart_modeli.dart';
import 'package:vizeodevi/provider/kartbilgileri_provider.dart';
import 'package:provider/provider.dart';
import 'package:vizeodevi/services/FirestoreKartBilgileriService.dart';

class kartBilgiGir extends StatefulWidget {
  final kartBilgileri kartbilgileri;

  kartBilgiGir([this.kartbilgileri]);
  @override
  _kartBilgiGirState createState() => _kartBilgiGirState();
}

class _kartBilgiGirState extends State<kartBilgiGir> {
  final kartsahibiController = TextEditingController();
  final ibanController = TextEditingController();

  @override
  void dispose() {
    kartsahibiController.dispose();
    ibanController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.kartbilgileri == null) {
      //New Record
      kartsahibiController.text = "";
      ibanController.text = "";
      new Future.delayed(Duration.zero, () {
        final domainfirmsProvider =
            Provider.of<kartbilgileri_provider>(context, listen: false);
        domainfirmsProvider.loadValues(kartBilgileri());
      });
    } else {
      //Controller Update
      kartsahibiController.text = widget.kartbilgileri.kartSahibi;
      ibanController.text = widget.kartbilgileri.iban;
      //State Update
      new Future.delayed(Duration.zero, () {
        final domainfirmsProvider =
            Provider.of<kartbilgileri_provider>(context, listen: false);
        domainfirmsProvider.loadValues(widget.kartbilgileri);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final domainfirmsProvider = Provider.of<kartbilgileri_provider>(context);

    return Scaffold(
      appBar: AppBar(
          title: (widget.kartbilgileri != null)
              ? Text('Kart bilgilerini Düzenle')
              : Text('Kart ekle')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: kartsahibiController,
              decoration: InputDecoration(hintText: 'Kart Sahibinin Adı'),
              onChanged: (value) {
                domainfirmsProvider.changekartSahibi(value);
              },
            ),
            TextField(
              controller: ibanController,
              decoration: InputDecoration(hintText: 'İban No:'),
              onChanged: (value) {
                domainfirmsProvider.changeiban(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Kaydet'),
              onPressed: () {
                domainfirmsProvider.saveProduct();
                Navigator.of(context).pop();
              },
            ),
            (widget.kartbilgileri != null)
                ? ElevatedButton(
                    child: Text('Sil'),
                    onPressed: () {
                      domainfirmsProvider
                          .removeProduct(widget.kartbilgileri.iban);
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
