#import <Specta.h>
#define EXP_SHORTHAND
#import <Expecta.h>

#import "ALAssetsLibrary+CameraRoll.h"

// THE TEST CODE SHOULD BE EXCUTED ON iOS8

SpecBegin(ALAssetsLibrary)

describe(@"ALAssetsLibrary + CameraRoll", ^{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library compat_enableCameraRoll];
    
    describe(@"- enumerateAssetsUsingBlock", ^{
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        pending(@"should enumerate all photos in the device", ^{
            [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                if (group.numberOfAssets == 0) { return; }
                
                [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                    if (stop != nil) { return; }
                    
                    [array addObject:result];
                }];
            } failureBlock:NULL];
            
            expect(array.count).will.equal([PHAsset fetchAssetsWithOptions:nil].count);
        });
    });
    
    describe(@"- numberOfAssets", ^{
        it(@"should get all photos in the device", ^{
            __block NSInteger count = 0;
            [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                if (group.numberOfAssets == 0) { return; }
                
                count = group.numberOfAssets;
            } failureBlock:NULL];
            
            expect(count).will.equal([PHAsset fetchAssetsWithOptions:nil].count);
        });
    });
});

describe(@"PHAsset", ^{
    describe(@"- thumbnail", ^{
        PHAsset *asset = [[PHAsset fetchAssetsWithOptions:nil] firstObject];
        UIImage *image = [UIImage imageWithCGImage:asset.thumbnail];
        
        it(@"should be greater than 150x150", ^{
            expect(image.size.width).to.beGreaterThan(150);
            expect(image.size.height).to.beGreaterThan(150);
        });
    });
    
    describe(@"- aspectFitThumbnail", ^{
        PHAsset *asset = [[PHAsset fetchAssetsWithOptions:nil] firstObject];
        UIImage *image = [UIImage imageWithCGImage:asset.thumbnail];
        
        it(@"should be greater than 150x150", ^{
            expect(image.size.width).to.beGreaterThan(150);
            expect(image.size.height).to.beGreaterThan(150);
        });
    });
});

SpecEnd
