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

/**
 *  Returns the thumbnail image of the asset.
 */
- (CGImageRef)thumbnail;

/**
 *  Returns the aspect-fit image of the asset.
 */
- (CGImageRef)aspectFitThumbnail;

# pragma mark - Properties (Private)

/**
 *  !!Private
 */
@property (nonatomic, strong) UIImage *thumbnailImage;

@end
