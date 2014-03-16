//
//  SKRetrieveDataModel.m
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "SKGetImagesModel.h"
#import "SKImageAssetManager.h"
#import "NSDictionary+Utilities.h"

@implementation SKImageInfo

@end

@implementation SKImageSet

- (id)init
{
    if (self = [super init])
    {
        self.assetImages = [NSMutableArray array];
    }
    return self;
}

@end

@implementation SKGetImagesModel

- (void)handleData:(NSDictionary *)parsedDict
{
    NSDictionary *dataDict = [parsedDict dictionaryForKey:@"data"];
    NSArray *assetArray = [dataDict arrayForKey:@"assetSets"];

    for (int i = 0; i < assetArray.count; i++)
    {
        NSDictionary *imageSetDict = assetArray[i];
        
        if ([imageSetDict isKindOfClass:[NSDictionary class]])
        {
            SKImageSet *imageSet = [[SKImageSet alloc] init];
            imageSet.displayName = [imageSetDict objectForKey:@"displayName"];
            imageSet.imageUrl = [imageSetDict objectForKey:@"imageUrl"];
            imageSet.size = [[imageSetDict objectForKey:@"size"] intValue];
            
            NSArray *images = [imageSetDict arrayForKey:@"assetImages"];
            NSMutableArray *tmpImages = [NSMutableArray array];
            
            for (int i = 0; i < images.count; i++)
            {
                NSDictionary *imageInfoDict = images[i];
                
                SKImageInfo *imageInfo = [[SKImageInfo alloc] init];
                imageInfo.width = [[imageInfoDict objectForKey:@"width"] floatValue];
                imageInfo.height = [[imageInfoDict objectForKey:@"height"] floatValue];
                imageInfo.url = [imageInfoDict objectForKey:@"url"];
                imageInfo.thumbUrl = [imageInfoDict objectForKey:@"thumbUrl"];
                imageInfo.imageId = [imageInfoDict objectForKey:@"id"];
                [tmpImages addObject:imageInfo];
            }
            imageSet.assetImages = tmpImages;
            
            [self.imageSets addObject:imageSet];
        }
    }
    
    [self updateAssets];
}

- (void)updateAssets
{
    [[SKImageAssetManager sharedManager] bindImageSets:self.imageSets];
}

- (NSMutableArray *)imageSets
{
    if (!_imageSets)
    {
        _imageSets = [NSMutableArray array];
    }
    return _imageSets;
}

@end
