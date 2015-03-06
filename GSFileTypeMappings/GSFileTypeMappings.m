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

- (NSArray *)extensionsForMIMEType:(NSString *)MIMEType {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, (__bridge CFStringRef)[MIMEType uppercaseString], NULL);
    if (!UTI) {
        return nil;
    }
    CFArrayRef extensions;
    if (UTTypeCopyAllTagsWithClass) {
        // OS X 10.10 / iOS 8.0 or later
        extensions = UTTypeCopyAllTagsWithClass(UTI, kUTTagClassFilenameExtension);
    } else {
        // OS X 10.9.x / iOS 7.x or earlier
        CFStringRef extension = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassFilenameExtension);
        CFIndex numValues = extension ? 1 : 0;
        extensions = CFArrayCreate(NULL, (void *)&extension, numValues, &kCFTypeArrayCallBacks);
        if (extension) {
            CFRelease(extension);
        }
    }
    CFRelease(UTI);
    return (__bridge_transfer NSArray *)extensions;
}

- (NSString *)preferredExtensionForMIMEType:(NSString *)MIMEType {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, (__bridge CFStringRef)[MIMEType uppercaseString], NULL);
    if (!UTI) {
        return nil;
    }
    CFStringRef extension = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassFilenameExtension);
    CFRelease(UTI);
    return (__bridge_transfer NSString *)extension;
}

- (NSString *)MIMETypeForExtension:(NSString *)extension {
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[extension uppercaseString], NULL);
    if (!UTI) {
        return nil;
    }
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    return (__bridge_transfer NSString *)MIMEType;
}

@end
