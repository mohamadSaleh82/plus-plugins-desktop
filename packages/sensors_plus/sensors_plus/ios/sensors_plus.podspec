#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint sensors_plus.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'sensors_plus'
  s.version          = '0.0.1'
  s.summary          = 'Flutter Sensors'
  s.description      = <<-DESC
Flutter plugin to access the accelerometer, gyroscope, magnetometer and barometer sensors.
                       DESC
  s.homepage         = 'https://github.com/mohamadsaleh82/plus_plugins'
  s.license          = { :type => 'BSD', :file => '../LICENSE' }
  s.author           = { 'Flutter Community Team' => 'authors@mohamadsaleh82.dev' }
  s.source           = { :http => 'https://github.com/mohamadsaleh82/plus_plugins/tree/main/packages/sensors_plus' }
  s.documentation_url = 'https://pub.dev/packages/sensors_plus'
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.resource_bundles = {'sensors_plus_privacy' => ['PrivacyInfo.xcprivacy']}
end
