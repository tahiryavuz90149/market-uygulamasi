import 'package:flutter/material.dart';

class Tesekkurler extends StatefulWidget {
  @override
  _TesekkurlerState createState() => _TesekkurlerState();
}

class _TesekkurlerState extends State<Tesekkurler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEŞEKKÜRLER"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              //images dosyasını yuvarlak içinde veriyor
              radius: 150.0, // resmin boyutunu ayarlıyor
              backgroundImage: AssetImage('assets/images/thank_you.jpg'),
            ),
            Text(
              " SAYGI DEĞER KULLANICIMIZ",
              style: TextStyle(fontSize: 15),
            ),
            Text(
                " Öncelikle uygulamamızı tercih ettiğiniz için teşekkür ederiz."),
            Text(
                " Bu uygulama sizin gibi arkadaşlarını davet eden kullanıcıların isteklerini gerçekleştirmek için geliştirildi."),
            Text("Arkadaşlarını bu uygulamaya davet ettiğin için teşekkürler.")
          ],
        ),
      ),
    );
  }
}
