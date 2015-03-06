//
//  GSFileTypeMappings.h
//  GSFileTypeMappings
//

@import Foundation.NSObject;

@class NSArray, NSString;

NS_CLASS_AVAILABLE(10_6, 3_0)
@interface GSFileTypeMappings : NSObject

+ (instancetype)sharedFileTypeMappings;

- (NSArray *)extensionsForMIMEType:(NSString *)MIMEType;
- (NSString *)preferredExtensionForMIMEType:(NSString *)MIMEType;
- (NSString *)MIMETypeForExtension:(NSString *)extension;

@end
