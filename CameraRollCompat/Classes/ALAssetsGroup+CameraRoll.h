//
//  ALAssetsGroup+CameraRoll.h
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsGroup (CameraRoll)

- (void)virtual_enumerateAssetsUsingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock;
- (NSInteger)virtual_numberOfAssets;

@end
