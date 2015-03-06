//
//  GSFileTypeMappingsTests.m
//  GSFileTypeMappings
//

@import Foundation;
@import XCTest;

#import "GSFileTypeMappings.h"

@interface GSFileTypeMappingsTests : XCTestCase
@end

@implementation GSFileTypeMappingsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSharedFileTypeMappings {
    GSFileTypeMappings *sharedFileTypeMappings1 = [GSFileTypeMappings sharedFileTypeMappings];
    XCTAssertNotNil(sharedFileTypeMappings1);
    GSFileTypeMappings *sharedFileTypeMappings2 = [GSFileTypeMappings sharedFileTypeMappings];
    XCTAssertEqual(sharedFileTypeMappings1, sharedFileTypeMappings2);
}

- (void)testExtensionsForMIMEType {
    GSFileTypeMappings *sharedFileTypeMappings = [GSFileTypeMappings sharedFileTypeMappings];
    // // nil
    // {
    //     XCTAssertNil([sharedFileTypeMappings extensionsForMIMEType:nil]);
    // }
    // // empty string
    // {
    //     NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@""];
    //     XCTAssertEqualObjects(@[], extensions);
    // }
    // // type only
    // {
    //     NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"text"];
    //     XCTAssertEqualObjects(@[], extensions);
    // }
    // // no subtype
    // {
    //     NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"text/"];
    //     XCTAssertEqualObjects(@[], extensions);
    // }
    // // no type
    // {
    //     NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"/plain"];
    //     XCTAssertEqualObjects(@[], extensions);
    // }
    // // invalid type
    // {
    //     NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"textt/plain"];
    //     XCTAssertEqualObjects(@[], extensions);
    // }
    // // invalid subtype
    // {
    //     NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"text/plainn"];
    //     XCTAssertEqualObjects(@[], extensions);
    // }
    // // extra semicolon
    // {
    //     NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"text/plain;"];
    //     XCTAssertEqualObjects(@[], extensions);
    // }
    // text/plain
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"text/plain"];
        XCTAssertTrue([extensions containsObject:@"txt"]);
    }
    // TEXT/PLAIN (uppercase)
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"TEXT/PLAIN"];
        XCTAssertTrue([extensions containsObject:@"txt"]);
    }
    // Text/Plain (capitalized)
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"Text/Plain"];
        XCTAssertTrue([extensions containsObject:@"txt"]);
    }
    // image/jpeg
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"image/jpeg"];
        XCTAssertTrue([extensions containsObject:@"jpeg"]);
    }
    // image/png
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"image/png"];
        XCTAssertTrue([extensions containsObject:@"png"]);
    }
    // audio/aiff
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"audio/aiff"];
        XCTAssertTrue([extensions containsObject:@"aifc"]);
    }
    // audio/wav
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"audio/wav"];
        XCTAssertTrue([extensions containsObject:@"wav"]);
    }
    // video/x-m4v
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"video/x-m4v"];
        XCTAssertTrue([extensions containsObject:@"m4v"]);
    }
    // video/mp4
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"video/mp4"];
        XCTAssertTrue([extensions containsObject:@"mp4"]);
    }
    // // application/octet-stream
    // {
    //     NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"application/octet-stream"];
    //     XCTAssertEqualObjects(@[], extensions);
    // }
    // application/pdf
    {
        NSArray *extensions = [sharedFileTypeMappings extensionsForMIMEType:@"application/pdf"];
        XCTAssertTrue([extensions containsObject:@"pdf"]);
    }
}

- (void)testPreferredExtensionForMIMEType {
    GSFileTypeMappings *sharedFileTypeMappings = [GSFileTypeMappings sharedFileTypeMappings];
    // // nil
    // {
    //     XCTAssertNil([sharedFileTypeMappings preferredExtensionForMIMEType:nil]);
    // }
    // // empty string
    // {
    //     XCTAssertNil([sharedFileTypeMappings preferredExtensionForMIMEType:@""]);
    // }
    // // type only
    // {
    //     XCTAssertNil([sharedFileTypeMappings preferredExtensionForMIMEType:@"text"]);
    // }
    // // no subtype
    // {
    //     XCTAssertNil([sharedFileTypeMappings preferredExtensionForMIMEType:@"text/"]);
    // }
    // // no type
    // {
    //     XCTAssertNil([sharedFileTypeMappings preferredExtensionForMIMEType:@"/plain"]);
    // }
    // // invalid type
    // {
    //     XCTAssertNil([sharedFileTypeMappings preferredExtensionForMIMEType:@"textt/plain"]);
    // }
    // // invalid subtype
    // {
    //     XCTAssertNil([sharedFileTypeMappings preferredExtensionForMIMEType:@"text/plainn"]);
    // }
    // // extra semicolon
    // {
    //     XCTAssertNil([sharedFileTypeMappings preferredExtensionForMIMEType:@"text/plain;"]);
    // }
    // text/plain
    {
        XCTAssertEqualObjects(@"txt", [sharedFileTypeMappings preferredExtensionForMIMEType:@"text/plain"]);
    }
    // TEXT/PLAIN (uppercase)
    {
        XCTAssertEqualObjects(@"txt", [sharedFileTypeMappings preferredExtensionForMIMEType:@"TEXT/PLAIN"]);
    }
    // Text/Plain (capitalized)
    {
        XCTAssertEqualObjects(@"txt", [sharedFileTypeMappings preferredExtensionForMIMEType:@"Text/Plain"]);
    }
    // image/jpeg
    {
        XCTAssertEqualObjects(@"jpeg", [sharedFileTypeMappings preferredExtensionForMIMEType:@"image/jpeg"]);
    }
    // image/png
    {
        XCTAssertEqualObjects(@"png", [sharedFileTypeMappings preferredExtensionForMIMEType:@"image/png"]);
    }
    // audio/aiff
    {
        XCTAssertEqualObjects(@"aifc", [sharedFileTypeMappings preferredExtensionForMIMEType:@"audio/aiff"]);
    }
    // audio/wav
    {
        XCTAssertEqualObjects(@"wav", [sharedFileTypeMappings preferredExtensionForMIMEType:@"audio/wav"]);
    }
    // video/x-m4v
    {
        XCTAssertEqualObjects(@"m4v", [sharedFileTypeMappings preferredExtensionForMIMEType:@"video/x-m4v"]);
    }
    // video/mp4
    {
        XCTAssertEqualObjects(@"mp4", [sharedFileTypeMappings preferredExtensionForMIMEType:@"video/mp4"]);
    }
    // application/octet-stream
    {
        XCTAssertNil([sharedFileTypeMappings preferredExtensionForMIMEType:@"application/octet-stream"]);
    }
    // application/pdf
    {
        XCTAssertEqualObjects(@"pdf", [sharedFileTypeMappings preferredExtensionForMIMEType:@"application/pdf"]);
    }
}

- (void)testMIMETypeForExtension {
    GSFileTypeMappings *sharedFileTypeMappings = [GSFileTypeMappings sharedFileTypeMappings];
    // // nil
    // {
    //     XCTAssertNil([sharedFileTypeMappings MIMETypeForExtension:nil]);
    // }
    // // empty string
    // {
    //     XCTAssertNil([sharedFileTypeMappings MIMETypeForExtension:@""]);
    // }
    // // invalid extension
    // {
    //     XCTAssertNil([sharedFileTypeMappings MIMETypeForExtension:@"foo"]);
    // }
    // txt
    {
        XCTAssertEqualObjects(@"text/plain", [sharedFileTypeMappings MIMETypeForExtension:@"txt"]);
    }
    // TXT (uppercase)
    {
        XCTAssertEqualObjects(@"text/plain", [sharedFileTypeMappings MIMETypeForExtension:@"TXT"]);
    }
    // Txt (capitalized)
    {
        XCTAssertEqualObjects(@"text/plain", [sharedFileTypeMappings MIMETypeForExtension:@"Txt"]);
    }
    // Txt
    {
        XCTAssertEqualObjects(@"text/plain", [sharedFileTypeMappings MIMETypeForExtension:@"Txt"]);
    }
    // jpg
    {
        XCTAssertEqualObjects(@"image/jpeg", [sharedFileTypeMappings MIMETypeForExtension:@"jpg"]);
    }
    // png
    {
        XCTAssertEqualObjects(@"image/png", [sharedFileTypeMappings MIMETypeForExtension:@"png"]);
    }
    // aif
    {
        XCTAssertEqualObjects(@"audio/aiff", [sharedFileTypeMappings MIMETypeForExtension:@"aif"]);
    }
    // wav
    {
        XCTAssertEqualObjects(@"audio/wav", [sharedFileTypeMappings MIMETypeForExtension:@"wav"]);
    }
    // m4v
    {
        XCTAssertEqualObjects(@"video/x-m4v", [sharedFileTypeMappings MIMETypeForExtension:@"m4v"]);
    }
    // mp4
    {
        XCTAssertEqualObjects(@"video/mp4", [sharedFileTypeMappings MIMETypeForExtension:@"mp4"]);
    }
    // pdf
    {
        XCTAssertEqualObjects(@"application/pdf", [sharedFileTypeMappings MIMETypeForExtension:@"pdf"]);
    }
}

@end
