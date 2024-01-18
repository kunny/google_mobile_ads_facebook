# Meta Audience Network mediation plugin for Google Mobile Ads Flutter

Google Mobile Ads Flutter mediation plugin for Meta Audience Network.

## Use this package as a library

```yaml
dependencies:
  google_mobile_ads_facebook:
    git:
      url: https://github.com/kunny/google_mobile_ads_facebook.git
      ref: <tag>
```

For example, if you want to depend on version `6.8.0`:

```yaml
dependencies:
  google_mobile_ads_facebook:
    git:
      url: https://github.com/kunny/google_mobile_ads_facebook.git
      ref: 6.8.0
```

Refer to the available tags on [here](https://github.com/kunny/google_mobile_ads_facebook/tags).

## Usage

Get the tracking authorization status by
calling `AppTrackingTransparency.trackingAuthorizationStatus`, which is available in
the [app_tracking_transparency](https://pub.dev/packages/app_tracking_transparency) package.

```dart

final authStatus = await AppTrackingTransparency.trackingAuthorizationStatus;
```

Call `GoogleMobileAdsFacebook.setAdvertiserTrackingEnabled()` to get personalized ads from Facebook.

```dart
await GoogleMobileAdsFacebook.setAdvertiserTrackingEnabled(authStatus == TrackingStatus.authorized);
```

Lastly, initialize the Google Mobile Ads SDK. Note that `setAdvertiserTrackingEnabled()` should be
called **before** you initialize the Google Mobile Ads SDK.

```dart
await MobileAds.instance.initialize();
```

## Disclaimer

This is not an official Google product.
