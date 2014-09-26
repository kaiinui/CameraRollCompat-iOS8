//
//  ALAssetsLibrary+CameraRoll.h
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014 kaiinui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "PHAsset+ALAssetAlias.h"

@interface ALAssetsLibrary (CameraRoll)

- (void)compat_enableCameraRoll;

@end
