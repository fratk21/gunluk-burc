// ignore: camel_case_types
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

// ignore: camel_case_types
class adMobservices {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      // return "ca-app-pub-3940256099942544/6300978111";
      return "ca-app-pub-3709415148414669/5863368408"; // yeni
    } else {
      return null;
    }
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => print("ad loaded"),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      print("hata $error");
    },
    onAdOpened: (ad) => print("açıldı"),
    onAdClosed: (ad) => print("kapatıldı"),
  );
}
