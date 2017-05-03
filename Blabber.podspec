Pod::Spec.new do |s|
  s.name             = "Blabber"
  s.version          = "1.0.2"
  s.summary          = "iOS modular logger based on CocoaLumberjack."
  s.homepage         = "https://github.com/SysdataSpA/Blabber"
  s.license          = 'Apache 2.0'
  s.author           = { "Sysdata S.p.A." => "team.mobile@sysdata.it" }
  s.source           = { :git => 'https://github.com/SysdataSpA/Blabber.git', :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Blabber/Classes/**/*'
  s.dependency 'CocoaLumberjack', '~> 2.0'
  s.xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'SD_LOGGER_AVAILABLE=1' }
end
