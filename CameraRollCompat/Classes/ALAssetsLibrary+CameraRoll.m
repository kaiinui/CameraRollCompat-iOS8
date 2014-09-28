
//
//  ALAssetsLibrary+CameraRoll.m
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014 kaiinui. All rights reserved.
//

#import "ALAssetsLibrary+CameraRoll.h"
#import "NSObject+Swizzle.h"

#import "ALAssetsGroup+CameraRoll.h"

@implementation ALAssetsLibrary (CameraRoll)

- (void)compat_enableCameraRoll {
    if ([self isiOS8OrGreater] == NO) { return; }
    
    // Avoid calling twice! It will cancel the enchant.
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self hijackAssetsGroup];
    });
}

# pragma mark - Helpers

- (void)hijackAssetsGroup {
    [ALAssetsGroup jr_swizzleMethod:@selector(enumerateAssetsUsingBlock:)
                         withMethod:@selector(virtual_enumerateAssetsUsingBlock:) error:NULL];
    [ALAssetsGroup jr_swizzleMethod:@selector(numberOfAssets)
                         withMethod:@selector(virtual_numberOfAssets) error:NULL];

}

- (BOOL)isiOS8OrGreater {
    NSArray *versions = [[[UIDevice currentDevice]systemVersion] componentsSeparatedByString:@"."]; // @"8.0.0"
    NSInteger versionMajor  = [[versions objectAtIndex:0] intValue];
    return (versionMajor >= 8);
}

@end
