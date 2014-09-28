
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

/**
 *  Enable Camera Roll Compatibility.
 *  It hijacks `ALAssetsGroup`'s `- enumerateAssetsUsingBlock:` if the `ALAssetsGroup`'s type is `ALAssetsGroupSavedPhoto` (a.k.a. former Camera Roll), then fallbacks using `PHAsset`.
 *  It does NOT do anything when OS version is lower than iOS7. (When Camera Roll is available.)
 */
- (void)compat_enableCameraRoll {
    if ([self isiOS8OrGreater] == NO) { return; }
    
    [self hijackAssetsGroup];
}

# pragma mark - Helpers

- (void)hijackAssetsGroup {
    [ALAssetsGroup jr_swizzleMethod:@selector(enumerateAssetsUsingBlock:) withMethod:@selector(virtual_enumerateAssetsUsingBlock:) error:NULL];
    [ALAssetsGroup jr_swizzleMethod:@selector(numberOfAssets) withMethod:@selector(virtual_numberOfAssets) error:NULL];
}

- (BOOL)isiOS8OrGreater {
    NSArray *versions = [[[UIDevice currentDevice]systemVersion] componentsSeparatedByString:@"."]; // @"8.0.0"
    NSInteger versionMajor  = [[versions objectAtIndex:0] intValue];
    return (versionMajor >= 8);
}

@end
