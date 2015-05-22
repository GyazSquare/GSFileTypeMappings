//
//  GSFileTypeMappings.h
//  GSFileTypeMappings
//

@import Foundation.NSObject;

@class NSArray, NSString;

@interface GSFileTypeMappings : NSObject

+ (instancetype)sharedFileTypeMappings;

- (NSArray *)extensionsForMIMEType:(NSString *)MIMEType;
- (NSString *)preferredExtensionForMIMEType:(NSString *)MIMEType;
- (NSString *)MIMETypeForExtension:(NSString *)extension;

@end
