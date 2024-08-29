Pod::Spec.new do |s|
  s.name             = 'package_info_plus'
  s.version          = '0.4.5'
  s.summary          = 'Flutter Package Info'
  s.description      = <<-DESC
This Flutter plugin provides an API for querying information about an application package.
Downloaded by pub (not CocoaPods).
                       DESC
  s.homepage         = 'https://github.com/mohamadsaleh82/plus_plugins'
  s.license          = { :type => 'BSD', :file => '../LICENSE' }
  s.author           = { 'Flutter Community Team' => 'authors@mohamadsaleh82.dev' }
  s.source           = { :http => 'https://github.com/mohamadsaleh82/plus_plugins/tree/main/packages/sensors_plus' }
  s.documentation_url = 'https://pub.dev/packages/sensors_plus'
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.resource_bundles = {'package_info_plus_privacy' => ['PrivacyInfo.xcprivacy']}
end
