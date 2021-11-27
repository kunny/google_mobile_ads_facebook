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

#import "AHMGoogleMobileAdsFacebookPlugin.h"

@implementation AHMGoogleMobileAdsFacebookPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"plugins.androidhuman.com/google_mobile_ads_facebook"
            binaryMessenger:[registrar messenger]];
  
  AHMGoogleMobileAdsFacebookPlugin* instance = [[AHMGoogleMobileAdsFacebookPlugin alloc] init];
  
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"FBAdSettings#setAdvertiserTrackingEnabled" isEqualToString:call.method]) {
    [FBAdSettings setAdvertiserTrackingEnabled:call.arguments[@"enabled"]];
    result(nil);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
