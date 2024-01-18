#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint google_mobile_ads_facebook.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'google_mobile_ads_facebook'
  s.version          = '0.0.1'
  s.summary          = 'Google Mobile Ads Flutter mediation plugin for Facebook Audience Network.'
  s.description      = <<-DESC
Google Mobile Ads mediation plugin for Facebook Audience Network.
                       DESC
  s.homepage         = 'https://github.com/kunny/google_mobile_ads_facebook'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Taeho Kim' => 'jyte82@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'GoogleMobileAdsMediationFacebook', '6.14.0.0'
  s.ios.deployment_target = '11.0'
  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
