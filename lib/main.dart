import 'package:encrypt_decrypt_message_bsg_odev1/sifreleme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController mesaj = new TextEditingController();
  TextEditingController key = new TextEditingController();
  String sifrelenmisMesaj = '';
  String orginalMesaj='';
  EnctyptionDycryption en = new EnctyptionDycryption();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödev1-180541603'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: mesaj,
              maxLength: 20,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.message),
                labelText: "Mesajınızı giriniz :",
              ),
            ),
            TextFormField(
              controller: key,
              keyboardType: TextInputType.number,
              maxLength: 2,
              decoration: InputDecoration(
                labelText: "Anahtarı giriniz (1-26) :",
              ),
            ),
            SizedBox(
              height: 10,
            ),

            ElevatedButton(
              child: Text('Şifrele'),
              onPressed: () {
                setState(
                  () {
                    sifrelenmisMesaj =
                        en.encryption(mesaj.text, int.parse(key.text));
                  },
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]
              ),
              width: double.infinity,
              child: Text('Şifrelenmiş metin :',style: TextStyle(fontSize: 19),),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              width: double.infinity,
              child: Text(sifrelenmisMesaj.toString(),style: TextStyle(fontSize: 18,color: Colors.red),),
            ),
            ElevatedButton(
              child: Text('Çöz'),
              onPressed: () {
                setState(() {
                  orginalMesaj=en.decryption(sifrelenmisMesaj,int.parse(key.text));
                });
              },
            ),

            SizedBox(height: 10,),

            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]
              ),
              width: double.infinity,
              child: Text('Orginal mesaj :',style: TextStyle(fontSize: 19),),
            ),

            SizedBox(height: 10,),

            Container(
              width: double.infinity,
              child: Text(orginalMesaj,style: TextStyle(fontSize: 19,color: Colors.blue),),
            ),
          ],
        ),
      ),
    );
  }
}
