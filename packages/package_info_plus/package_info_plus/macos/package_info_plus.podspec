#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'package_info_plus'
  s.version          = '0.0.1'
  s.summary          = 'Flutter Package Info'
  s.description      = <<-DESC
  A macOS implementation of the package_info_plus plugin.
                       DESC
  s.homepage         = 'https://github.com/mohamadsaleh82/package_info_plus'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Flutter Community' => 'authors@mohamadsaleh82.dev' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'FlutterMacOS'
  s.platform = :osx, '10.14'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
