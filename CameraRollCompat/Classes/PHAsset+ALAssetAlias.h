//
//  PHPhoto+ALAssetAlias.h
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface PHAsset (ALAssetAlias)

- (CGImageRef)thumbnail;
- (CGImageRef)aspectFitThumbnail;

@end
