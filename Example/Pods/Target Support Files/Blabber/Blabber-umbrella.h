#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SDDDFormatter.h"
#import "SDLogger.h"
#import "SDLogModules.h"
#import "Blabber-Bridging-Header.h"

FOUNDATION_EXPORT double BlabberVersionNumber;
FOUNDATION_EXPORT const unsigned char BlabberVersionString[];

