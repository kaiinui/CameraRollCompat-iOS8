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

/**
 *  Enable Camera Roll Compatibility.
 *  It hijacks `ALAssetsGroup`'s `- enumerateAssetsUsingBlock:` if the `ALAssetsGroup`'s type is `ALAssetsGroupSavedPhoto` (a.k.a. former Camera Roll), then fallbacks using `PHAsset`.
 *  It does NOT do anything when OS version is lower than iOS7. (When Camera Roll is available.)
 */
- (void)compat_enableCameraRoll;

@end
