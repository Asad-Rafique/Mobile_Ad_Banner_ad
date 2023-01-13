

// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MobAD extends StatefulWidget {
  const MobAD({super.key});

  @override
  State<MobAD> createState() => _MobADState();
}

class _MobADState extends State<MobAD> {

BannerAd? bannerAd;
bool isloaded=false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd=BannerAd(
      size: AdSize.banner,
       adUnitId: "ca-app-pub-3940256099942544/6300978111", 
       listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isloaded=true;
            
          });
        print("Banner is Loaded");
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
       ),
        request: const AdRequest());
        bannerAd!.load();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Spacer(),
            isloaded?
            Container(
              height: 150,
              child: AdWidget(ad: bannerAd!),)
              :
              Container(
                height: 50,
                child:const Center(child: Text("AD")),
              ),
          ],
        ),
      ),
    );
  }
}