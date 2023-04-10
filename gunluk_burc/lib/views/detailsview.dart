import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gunluk_burc/model/datas.dart';
import 'package:gunluk_burc/views/constants.dart';
import 'package:gunluk_burc/ads_service/ads_services.dart';

import '../model/list_COMPLIMENTS.dart';

class DetailsView extends StatefulWidget {
  final PlanetInfo? planetInfo;
  const DetailsView({super.key, this.planetInfo});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

Random randomsayi = new Random();
int a = randomsayi.nextInt(47);

class _DetailsViewState extends State<DetailsView> {
  BannerAd? _banner;

  @override
  void initState() {
    _createBannerAd();
    a = randomsayi.nextInt(14);
    super.initState();
  }

  void dispose() {
    // ignore: deprecated_member_use

    super.dispose();
  }

  void _createBannerAd() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: adMobservices.bannerAdUnitId!,
        listener: adMobservices.bannerAdListener,
        request: const AdRequest())
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 32),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Text(
                    widget.planetInfo!.name.toString(),
                    style: TextStyle(
                        fontSize: 55,
                        fontFamily: 'Avenir',
                        color: primaryTextColor,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.planetInfo!.position.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Avenir',
                        color: primaryTextColor,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.left,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Text(
                        widget.planetInfo!.description.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Avenir',
                            color: contentTextColor,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                        maxLines: 60,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "DATING HOROSCOPE",
                    style: TextStyle(
                        fontSize: 24,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: 'Avenir',
                        color: contentTextColor,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                    maxLines: 40,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Text(
                        widget.planetInfo!.images![0].toString(),
                        style: TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Avenir',
                            color: contentTextColor,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                        maxLines: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: -70,
              child: Hero(
                  tag: widget.planetInfo!.position,
                  child: Image.asset(widget.planetInfo!.iconImage.toString()))),
          Positioned(
              top: 70,
              left: 0,
              child: Text(
                compliments2[a].toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 50,
                    color: Colors.grey.withOpacity(0.2)),
              )),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new))
        ],
      )),
      bottomNavigationBar: _banner == null
          ? Container()
          : Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 52,
              child: AdWidget(ad: _banner!),
            ),
    );
  }
}
