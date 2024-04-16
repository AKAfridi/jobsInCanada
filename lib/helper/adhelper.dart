import 'dart:developer';
import 'package:easy_audience_network/easy_audience_network.dart';
import 'package:flutter/material.dart';

class Adhelper {
  static void init() {
    EasyAudienceNetwork.init(testMode: false
        // iOSAdvertiserTrackingEnabled: true //default false
        );
  }

  static Widget showNativeBannerAd() {
    return SafeArea(
      child: NativeAd(
        placementId: '389192566919791_407136658458715',
        adType: NativeAdType.NATIVE_BANNER_AD,
        bannerAdSize: NativeBannerAdSize.HEIGHT_100,
        width: double.infinity,
        height: 100,
        listener: NativeAdListener(
          onError: (code, message) => log('error'),
          onLoaded: () => log('loaded'),
          onClicked: () => log('clicked'),
          onLoggingImpression: () => log('logging impression'),
          onMediaDownloaded: () => log('media downloaded'),
        ),
      ),
    );
  }

  static void showInterstitialAd() {
    final interstitialAd = InterstitialAd("389192566919791_389194360252945");
    interstitialAd.listener = InterstitialAdListener(
      onLoaded: () {
        interstitialAd.show();
      },
      onDismissed: () {
        interstitialAd.destroy();
        log('Interstitial dismissed');
      },
    );
    interstitialAd.load();
  }
}
