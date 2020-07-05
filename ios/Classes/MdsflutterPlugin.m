#import "MdsflutterPlugin.h"
#if __has_include(<mdsflutter/mdsflutter-Swift.h>)
#import <mdsflutter/mdsflutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mdsflutter-Swift.h"
#endif

@implementation MdsflutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMdsflutterPlugin registerWithRegistrar:registrar];
}
@end
