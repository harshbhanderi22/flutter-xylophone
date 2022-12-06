
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admob{
  AppOpenAd? openAd;
  BannerAd? bannerAd;
  RewardedAd? rewardad;

  Future<void> loadopenad() async{
    await AppOpenAd.load(
        adUnitId: 'ca-app-pub-3873555551284541/7814943702',
        request: AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad){
              print("Open Ad Loaded");
              openAd = ad;
              openAd!.show();
            },
            onAdFailedToLoad: (ad){
              print("Open ad failed");
            }),
        orientation: AppOpenAd.orientationPortrait);
  }

  Future<void> loadrewardad() async{
    await RewardedAd.load(
        adUnitId: 'ca-app-pub-3873555551284541/3373776442',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad) {
              print('Video Ad Loaded');
              rewardad = ad;
              rewardad!.show(onUserEarnedReward: (ad,reward){
                print("Rewarded");
              });
            },
            onAdFailedToLoad: (ad) {
              print("Video Failed");
            }
        )
    );
  }
}