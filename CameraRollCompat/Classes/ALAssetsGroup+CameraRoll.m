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
    ALAssetsGroupType type = [[self valueForProperty:ALAssetsGroupPropertyType] longValue];
    if(type != ALAssetsGroupSavedPhotos) { // If not Camera Roll
        // Because `- enumerateAssetsUsingBlock:` is hooked.
        [self enumerateAssetsWithOptions:NSEnumerationConcurrent usingBlock:enumerationBlock];
        return;
    }
    
    [self enumerateAllAssetsUsingBlock:enumerationBlock];
}

- (NSInteger)virtual_numberOfAssets {
    PHFetchResult *result = [PHAsset fetchAssetsWithOptions:nil];
    return result.count;
}

# pragma mark - Helpers

- (void)enumerateAllAssetsUsingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock {
    PHFetchResult *result = [PHAsset fetchAssetsWithOptions:nil];
    [result enumerateObjectsUsingBlock:^(PHAsset *photoAsset, NSUInteger idx, BOOL *stop) {
        ALAsset *asset = (ALAsset *)photoAsset;
        enumerationBlock(asset, idx, stop);
    }];
}

@end
