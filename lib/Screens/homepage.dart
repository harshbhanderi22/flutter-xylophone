import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:xylophone/Widget/sound_plate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  BannerAd? bannerad;
   bool isBannerLoaded = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    bannerad = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3873555551284541/2023529155",
        listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              isBannerLoaded = true;
            });
            print("Ad is loaded");
          },
          onAdFailedToLoad: (ad, error){
            ad.dispose();
            print(error);
          }
        ),
        request: AdRequest()
    );
    bannerad!.load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            SoundPlate(noteindex: 1, color: Colors.red),
            SoundPlate(noteindex: 2, color: Colors.orange),
            SoundPlate(noteindex: 3, color: Colors.yellow),
            SoundPlate(noteindex: 4, color: Colors.green),
            SoundPlate(noteindex: 5, color: Colors.blue),
            SoundPlate(noteindex: 6, color: Colors.lightGreen),
            SoundPlate(noteindex: 7, color: Colors.purple),
            Expanded(
              child: Container(
                child: isBannerLoaded ? AdWidget(ad: bannerad!) : Container(child:
                Center(child: Text("Google Ads", style: TextStyle(color: Colors.white),))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
