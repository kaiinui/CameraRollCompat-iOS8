//
//  PHPhoto+ALAssetAlias.m
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "PHAsset+ALAssetAlias.h"

@implementation PHAsset (ALAssetAlias)

- (CGImageRef)thumbnail {
    __block CGImageRef imageRef = nil;
    
    [[PHImageManager defaultManager] requestImageForAsset:self targetSize:CGSizeMake(100, 100) contentMode:PHImageContentModeDefault options:nil resultHandler:^(UIImage *result, NSDictionary *info) {
        imageRef = [result CGImage];
    }];
    
    while(imageRef == nil) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
    
    return imageRef;
}

@end
