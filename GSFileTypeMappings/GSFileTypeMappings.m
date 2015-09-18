//
//  GSFileTypeMappings.m
//  GSFileTypeMappings
//

@import Foundation;

#import "GSFileTypeMappings.h"
#import "GSSynthesizeSingleton.h"

#if !defined(TARGET_OS_IPHONE) || !TARGET_OS_IPHONE
@import CoreServices;
#else
#import <MobileCoreServices/MobileCoreServices.h>
#endif

@implementation GSFileTypeMappings

GSSynthesizeSingleton(GS, FileTypeMappings);

- (nullable NSArray<NSString *> *)extensionsForMIMEType:(nullable NSString *)MIMEType {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, (__bridge CFStringRef)MIMEType, NULL);
    if (!UTI) {
        return nil;
    }
    CFArrayRef extensions;
#if !TARGET_OS_WATCH
    if (UTTypeCopyAllTagsWithClass) {
#endif
        // OS X 10.10 / iOS 8.0 / watchOS 2 or later
        extensions = UTTypeCopyAllTagsWithClass(UTI, kUTTagClassFilenameExtension);
#if !TARGET_OS_WATCH
    } else {
        // OS X 10.9.x / iOS 7.x or earlier
        CFStringRef extension = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassFilenameExtension);
        CFIndex numValues = extension ? 1 : 0;
        extensions = CFArrayCreate(NULL, (void *)&extension, numValues, &kCFTypeArrayCallBacks);
        if (extension) {
            CFRelease(extension);
        }
    }
#endif
    CFRelease(UTI);
    return (__bridge_transfer NSArray *)extensions;
}

- (nullable NSString *)preferredExtensionForMIMEType:(nullable NSString *)MIMEType {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, (__bridge CFStringRef)MIMEType, NULL);
    if (!UTI) {
        return nil;
    }
    CFStringRef extension = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassFilenameExtension);
    CFRelease(UTI);
    return (__bridge_transfer NSString *)extension;
}

- (nullable NSString *)MIMETypeForExtension:(nullable NSString *)extension {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)extension, NULL);
    if (!UTI) {
        return nil;
    }
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    return (__bridge_transfer NSString *)MIMEType;
}

@end
