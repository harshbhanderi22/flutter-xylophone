import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:xylophone/Screens/homepage.dart';
import 'package:xylophone/Ads/all_ads.dart';

var ads = Admob();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //await ads.loadopenad();
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Xylophone"),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0.5,
          ),
          body: HomePage(),
        ),
      ),
    );
  }
}
