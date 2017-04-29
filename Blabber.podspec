#
# Be sure to run `pod lib lint Blabber.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Blabber'
  s.version          = '1.0.1'
  s.summary          = 'iOS modular logger based on CocoaLumberjack.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/SysdataSpA/Blabber'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'francescoceravolo' => 'team.mobile@sysdata.it' }
  s.source           = { :git => 'https://github.com/SysdataSpA/Blabber.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Blabber/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Blabber' => ['Blabber/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'CocoaLumberjack', '~> 2.0'
  s.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'SD_LOGGER_AVAILABLE=1' }
end
