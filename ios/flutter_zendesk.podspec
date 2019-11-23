#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'flutter_zendesk'
  s.version          = '0.0.1'
  s.summary          = 'A Zendesk Flutter plugin.'
  s.description      = <<-DESC
  A Zendesk Flutter plugin.
                       DESC
  s.homepage         = 'http://https://github.com/sad1996/flutter_zendesk'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'NowApps Technologies' => 'sadak@nowappstech.com\nkishan@nowappstech.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.ios.vendored_frameworks = 'Frameworks/ZendeskSDK.framework'
  s.static_framework = true
  s.platform = '10.0'
  s.ios.deployment_target = '10.0'

  s.dependency 'ZendeskSDK', '4.0.0'

end

