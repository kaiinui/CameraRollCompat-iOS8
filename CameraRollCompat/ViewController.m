//
//  ViewController.m
//  CameraRollCompat
//
//  Created by kaiinui on 2014/09/26.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

#import "ALAssetsLibrary+CameraRoll.h"
#import "PHAsset+ALAssetAlias.h"

@interface ViewController ()

@property NSMutableArray *assets;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.assets = [[NSMutableArray alloc] init];
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library compat_enableCameraRoll];
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        NSLog(@"%d", group.numberOfAssets);
        if (group.numberOfAssets == 0) {
            [self.collectionView reloadData];
            return;
        }
        
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            [self.assets addObject:result];
        }];
    } failureBlock:NULL];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    ALAsset *asset = self.assets[indexPath.row];
    UIImage *image = [UIImage imageWithCGImage:asset.thumbnail];
    cell.imageView.image = image;
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assets.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

@end
