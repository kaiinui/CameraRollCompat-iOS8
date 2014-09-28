//
//  ALAssetsGroup+CameraRoll.m
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "ALAssetsGroup+CameraRoll.h"

#import <Photos/Photos.h>

@implementation ALAssetsGroup (CameraRoll)

- (void)virtual_enumerateAssetsUsingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock {
    if([self isCameraRoll]) {
        [self enumerateAllAssetsUsingBlock:enumerationBlock];
        return;
    }
    
    // Because `- enumerateAssetsUsingBlock:` is swizzled.
    // I know it is not good :/
    // TODO
    [self enumerateAssetsWithOptions:NSEnumerationConcurrent usingBlock:enumerationBlock];
}

- (NSInteger)virtual_numberOfAssets {
    return [self allAssets].count;
}

# pragma mark - Helpers

- (BOOL)isCameraRoll {
    ALAssetsGroupType type = [[self valueForProperty:ALAssetsGroupPropertyType] longValue];
    return (type == ALAssetsGroupSavedPhotos);
}

- (void)enumerateAllAssetsUsingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock {
    [[self allAssets] enumerateObjectsUsingBlock:^(PHAsset *photoAsset, NSUInteger idx, BOOL *stop) {
        ALAsset *asset = (ALAsset *)photoAsset; // TODO: I know it is not good :/
        enumerationBlock(asset, idx, stop);
    }];
}

- (PHFetchResult *)allAssets {
    return [PHAsset fetchAssetsWithOptions:nil];
}

@end
