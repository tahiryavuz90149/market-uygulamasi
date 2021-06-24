import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart'; // kayan noktalı sayı için kütüphane
import 'package:flutter/services.dart'; // textfield da rakam kullanmak için kütüphane
import 'package:provider/provider.dart';
import 'package:vizeodevi/auth/auth_methods.dart';
import 'package:vizeodevi/hakkında.dart';
import 'package:vizeodevi/Icerik/icerik.dart';
import 'package:vizeodevi/Dosya_İslemi/file_utils.dart';
import 'package:vizeodevi/services/FirestoreKartBilgileriService.dart';
import 'package:vizeodevi/users/uyeler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vizeodevi/provider/kartbilgileri_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FlutterFireAuthService>(
          create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<FlutterFireAuthService>().authStateChanges,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (context) => kartbilgileri_provider()),
        StreamProvider(
            create: (context) =>
                FirestoreKartBilgileriService().getKartBilgileri()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:
            false, // appbar daki debug yazısını kaldırır
        title: 'Yavuz AVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String adsoyad = '';
  String adres = '';
  String telefon = '';
  String fileContents = "Veri yok";
  final myController = TextEditingController();

  void _adSoyadKaydet(String text) {
    setState(() {
      adsoyad = text;
    });
  }

  void _adresKaydet(String text) {
    setState(() {
      adres = text;
    });
  }

  void _telefonKaydet(String text) {
    setState(() {
      telefon = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool ilerle = true;
    if ((adsoyad.length >= 5) &&
        (adres.length > 15) &&
        (telefon.length == 11)) {
      ilerle = false;
    } else {
      ilerle = true;
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Yavuz AVM"),
        centerTitle: true, // appbar yazısını ortalar.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.cyanAccent,
              height: 20,
              child: Marquee(
                text: 'YAVUZ ALIŞVERİŞ MERKEZİNE HOŞGELDİNİZ.',
                style: TextStyle(fontWeight: FontWeight.bold),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 1),
                showFadingOnlyWhenScrolling: true,
                fadingEdgeStartFraction: 0.1,
                fadingEdgeEndFraction: 0.1,
                numberOfRounds: 3,
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            Expanded(
              // Expended widget i resmin kalan alana uyarlanmasını sağlıyor
              child: CircleAvatar(
                //images dosyasını yuvarlak içinde veriyor
                radius: 140.0, // resmin boyutunu ayarlıyor
                backgroundImage: AssetImage('assets/images/Yavuz_Logo.jpg'),
              ),
            ),
            SizedBox(
              // resim ile yazı arasına boşluk koymak için kullanılan widget
              height: 10.0,
            ),
            Text(
              'Adınızı ve Soyadınızı Giriniz:',
            ),
            Padding(
              padding: const EdgeInsets.all(
                  5.0), // her taraftan 5 piksel mesafe verdi.
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  border:
                      OutlineInputBorder(), //text form field witget ini çerçeve içine alıyor
                  hintText: 'Ad Soyad:',
                ),
                keyboardType: TextInputType.text,
                onChanged: (text) {
                  _adSoyadKaydet(text);
                },
              ),
            ),
            Divider(
              //aradaki turuncu çizgiyi oluşturuyor
              color: Colors.orange,
              height: 0.1, // divider yüksekliği
              thickness: 5, // divider ın kalınlığı
              indent: 5, // divider ın kenarlardaki boşluğu
            ),
            Text(
              'Adresinizi Giriniz:',
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border:
                      OutlineInputBorder(), //text form field witget ini çerçeve içine alıyor
                  hintText: 'Adres: il/ilçe/mahalle/sokak/no',
                ),
                keyboardType: TextInputType.text,
                onChanged: (text) {
                  _adresKaydet(text);
                },
              ),
            ),
            Divider(
              //aradaki turuncu çizgiyi oluşturuyor
              color: Colors.orange,
              height: 0.1, // divider yüksekliği
              thickness: 5, // divider ın kalınlığı
              indent: 5, // divider ın kenarlardaki boşluğu
            ),
            Text(
              'Telefon Numaranızı Giriniz:',
            ),
            Padding(
              padding: const EdgeInsets.all(
                  5.0), // her taraftan 10 piksel mesafe verdi.
              child: TextFormField(
                decoration: const InputDecoration(
                  border:
                      OutlineInputBorder(), //text form field witget ini çerçeve içine alıyor
                  hintText: 'Tel No: (0 555 555 55 55)',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                //yukarıdaki iki satır telefon numrarası kısmına sadece rakam almasını sağlıyor

                onChanged: (text) {
                  _telefonKaydet(text);
                },
              ),
            ),
            Divider(
              //aradaki turuncu çizgiyi oluşturuyor
              color: Colors.orange,
              height: 0.1, // divider yüksekliği
              thickness: 5, // divider ın kalınlığı
              indent: 5, // divider ın kenarlardaki boşluğu
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => uyeler()),
                        );
                      },
                      child: Text('Üye Ol'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Hakkinda()),
                        );
                      },
                      child: Text('Hakkında'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        ilerle
                            ? null
                            : (Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => icerik(),
                                    settings: RouteSettings(
                                        arguments:
                                            adsoyad) // ad soyad değişkenini içerik sayfasına yolluyoruz
                                    ),
                              ));
                        FileUtils.saveToFile(myController.text);
                      },
                      child: Text('İleri'),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
