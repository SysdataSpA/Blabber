#
# Be sure to run `pod lib lint Blabber.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Blabber"
  s.version          = "1.1.7"
  s.swift_version    = '4.2'
  s.summary          = "iOS modular logger based on CocoaLumberjack."
  s.homepage         = "https://github.com/SysdataSpA/Blabber"
  s.license          = 'Apache 2.0'
  s.author           = { "Sysdata S.p.A." => "team.mobile@sysdata.it" }

  s.source           = { :git => 'https://github.com/SysdataSpA/Blabber.git', :tag => s.version.to_s }

  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  # s.resource_bundles = {
  #   'Blabber' => ['Blabber/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'


  s.subspec 'Core' do |co|
    co.source_files = 'Blabber/Classes/Base/**/*'
    co.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'BLABBER=1' }
  end

  s.subspec 'CocoaLumberjack' do |cl|
     cl.source_files = 'Blabber/Classes/CocoaLumberjack/*'
     cl.dependency 'Blabber/Core'
     cl.dependency 'CocoaLumberjack', '~> 3.5.1'

     cl.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'COCOALUMBERJACK=1' }
  end

  s.default_subspec = 'Core'

end
