//
//  ALAssetsGroup+CameraRoll.h
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsGroup (CameraRoll)

/**
 *  `- enumerateAssetsUsingBlock:` which supports Camera Roll in iOS8.
 *  It shoule be swizzled with original one.
 */
- (void)virtual_enumerateAssetsUsingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock;

/**
 *  `- numberOfAssets` which supports Camera Roll in iOS8.
 *  It should be swizzled with original one.
 *
 *  @return The number of assets contained in this `ALAssetsGroup`.
 */
- (NSInteger)virtual_numberOfAssets;

@end
