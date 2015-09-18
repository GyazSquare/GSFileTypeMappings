//
//  GSFileTypeMappings.h
//  GSFileTypeMappings
//

@import Foundation.NSObject;

NS_ASSUME_NONNULL_BEGIN

@class NSArray, NSString;

@interface GSFileTypeMappings : NSObject

+ (instancetype)sharedFileTypeMappings;

- (nullable NSArray<NSString *> *)extensionsForMIMEType:(nullable NSString *)MIMEType;
- (nullable NSString *)preferredExtensionForMIMEType:(nullable NSString *)MIMEType;
- (nullable NSString *)MIMETypeForExtension:(nullable NSString *)extension;

@end

NS_ASSUME_NONNULL_END
