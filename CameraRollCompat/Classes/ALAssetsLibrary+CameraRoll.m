
//
//  ALAssetsLibrary+CameraRoll.m
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014 kaiinui. All rights reserved.
//

#import "ALAssetsLibrary+CameraRoll.h"
#import <Aspects.h>
#import "NSObject+Swizzle.h"

#import "ALAssetsGroup+CameraRoll.h"

@implementation ALAssetsLibrary (CameraRoll)

- (void)compat_enableCameraRoll {
#warning If iOS8
    [self hijackAssetsGroup];
#warning Do
    //[self hijackAsset];
}

# pragma mark - Helpers

- (void)hijackAssetsGroup {
    [ALAssetsGroup aspect_hookSelector:@selector(enumerateAssetsUsingBlock:)
                           withOptions:AspectPositionInstead usingBlock:^(id<AspectInfo> aspectInfo, ALAssetsGroupEnumerationResultsBlock enumerationBlock) {
                               ALAssetsGroup *group = aspectInfo.instance;
                               [group virtual_enumerateAssetsUsingBlock:enumerationBlock];
    } error:NULL];
    
    [ALAssetsGroup jr_swizzleMethod:@selector(numberOfAssets) withMethod:@selector(virtual_numberOfAssets) error:NULL];
}

@end
