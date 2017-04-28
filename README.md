# Blabber

[![Version](https://img.shields.io/cocoapods/v/Blabber.svg?style=flat)](http://cocoapods.org/pods/Blabber)
[![License](https://img.shields.io/cocoapods/l/Blabber.svg?style=flat)](http://cocoapods.org/pods/Blabber)
[![Platform](https://img.shields.io/cocoapods/p/Blabber.svg?style=flat)](http://cocoapods.org/pods/Blabber)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 8 and above, CocoaLumberjack (as pod dependency)

## Installation

Docker is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Blabber"
```

## License

Blabber is available under the Apache license. See the LICENSE file for more info.

## Introduction
Blabber is a library that wraps **CocoaLumberjack** and could be use to define different log levels for different modules. If you don't want to specify a specific module will be used a generic logger.

This library is also used by **[Umarell](https://github.com/SysdataSpA/Umarell)** and **[Docker](https://github.com/SysdataSpA/Docker)**.

To define a specific module define **SDLoggerModuleProtocol**



```
#ifdef SD_LOGGER_AVAILABLE

- (NSString*) loggerModuleName
{
    return kDownloadManagerLogModuleName;
}

- (SDLogLevel) loggerModuleLogLevel
{
    return [[SDLogger sharedLogger] logLevelForModuleWithName:self.loggerModuleName];
}

- (void) setLoggerModuleLogLevel:(SDLogLevel)level
{
    [[SDLogger sharedLogger] setLogLevel:level forModuleWithName:self.loggerModuleName];
}
#endif

```

Once this pod is installed, it will be available the processor macro **SD_LOGGER_AVAILABLE**, so you can check inside your pod if you can implement SDLoggerModuleProtocol and use Blabber as logger.

