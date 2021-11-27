// Copyright 2021 Taeho Kim <jyte82@gmail.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';

import 'package:google_mobile_ads_facebook/google_mobile_ads_facebook.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authStatus = await AppTrackingTransparency.trackingAuthorizationStatus;
  await GoogleMobileAdsFacebook.setAdvertiserTrackingEnabled(
      authStatus == TrackingStatus.authorized);
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
      ),
    );
  }
}
