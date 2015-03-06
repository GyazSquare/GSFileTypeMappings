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
    NSLog(@"%s: MIMEType=%@", __PRETTY_FUNCTION__, MIMEType);
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, (__bridge CFStringRef)MIMEType, kUTTypeData);
    if (!UTI) {
        NSLog(@"%s: UTI=NULL", __PRETTY_FUNCTION__);
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
    NSLog(@"%s: extensions=%@", __PRETTY_FUNCTION__, extensions);
    return (__bridge_transfer NSArray *)extensions;
}

- (NSString *)preferredExtensionForMIMEType:(NSString *)MIMEType {
    NSLog(@"%s: MIMEType=%@", __PRETTY_FUNCTION__, MIMEType);
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType, (__bridge CFStringRef)MIMEType, kUTTypeData);
    if (!UTI) {
        NSLog(@"%s: UTI=NULL", __PRETTY_FUNCTION__);
        return nil;
    }
    CFStringRef extension = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassFilenameExtension);
    CFRelease(UTI);
    NSLog(@"%s: extension=%@", __PRETTY_FUNCTION__, extension);
    return (__bridge_transfer NSString *)extension;
}

- (NSString *)MIMETypeForExtension:(NSString *)extension {
    NSLog(@"%s: extension=%@", __PRETTY_FUNCTION__, extension);
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)extension, kUTTypeData);
    if (!UTI) {
        NSLog(@"%s: UTI=NULL", __PRETTY_FUNCTION__);
        return nil;
    }
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    NSLog(@"%s: MIMEType=%@", __PRETTY_FUNCTION__, MIMEType);
    return (__bridge_transfer NSString *)MIMEType;
}

@end
