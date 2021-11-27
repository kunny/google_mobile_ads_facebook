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

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mobile_ads_facebook/google_mobile_ads_facebook.dart';

void main() {
  const MethodChannel channel =
      MethodChannel('plugins.androidhuman.com/google_mobile_ads_facebook');

  final log = <MethodCall>[];

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      switch (methodCall.method) {
        case 'FBAdSettings#setAdvertiserTrackingEnabled':
          return null;
        default:
          assert(false);
          return null;
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('FBAdSettings#setAdvertiserTrackingEnabled', () async {
    await GoogleMobileAdsFacebook.setAdvertiserTrackingEnabled(true);

    expect(log, <Matcher>[
      isMethodCall('FBAdSettings#setAdvertiserTrackingEnabled', arguments: {
        'enabled': true,
      }),
    ]);
  });
}
