//
//  PHPhoto+ALAssetAlias.m
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "PHAsset+ALAssetAlias.h"
#import <objc/runtime.h>

@implementation PHAsset (ALAssetAlias)

- (CGImageRef)thumbnail {
    __block CGImageRef imageRef = nil;
    
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat; // To have resultHandler called only once.
    __weak typeof (self) weakSelf = self;
    [[PHImageManager defaultManager] requestImageForAsset:self targetSize:CGSizeMake(150, 150) contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage *result, NSDictionary *info) {
        weakSelf.thumbnailImage = result; // To Retain the UIImage.
        imageRef = [result CGImage];
    }];
    
    // A hack to wait run blocks synchronously.
    while(imageRef == nil) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.005]];
    }
    
    return imageRef;
}

#warning TODO: Avoid DRY
- (CGImageRef)aspectFitThumbnail {
    __block CGImageRef imageRef = nil;
    
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat; // To have resultHandler called only once.
    __weak typeof (self) weakSelf = self;
    [[PHImageManager defaultManager] requestImageForAsset:self targetSize:CGSizeMake(150, 150) contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage *result, NSDictionary *info) {
        weakSelf.thumbnailImage = result; // To Retain the UIImage.
        imageRef = [result CGImage];
    }];
    
    // A hack to wait run blocks synchronously.
    while(imageRef == nil) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.005]];
    }
    
    return imageRef;
}

# pragma mark - Properties (Private)

#warning TOOD: Separete it into another category.

- (UIImage *)thumbnailImage {
    return objc_getAssociatedObject(self, @selector(thumbnailImage));
}

- (void)setThumbnailImage:(UIImage *)thumbnailImage {
    objc_setAssociatedObject(self, @selector(thumbnailImage), thumbnailImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
