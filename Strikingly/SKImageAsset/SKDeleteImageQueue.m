//
//  SKDeleteImageQueue.m
//  Strikingly
//
//  Created by Tu You on 14-3-15.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "SKDeleteImageQueue.h"
#import "SKDeleteImageModel.h"
#import "SKImageAssetManager.h"

@interface SKDeleteImageQueue ()

@property (nonatomic, strong) NSMutableDictionary *deleteImageDict;

@end


@implementation SKDeleteImageQueue

- (void)deleteImage:(UIImage *)image withPath:(NSString *)imagePath
{
    if (!image || !imagePath)
    {
        return;
    }
    
    if ([self.deleteImageDict objectForKey:imagePath])
    {
        return;
    }
    
    SKDeleteImageModel *deleteImageModel = [[SKDeleteImageModel alloc] init];
    deleteImageModel.imageToDelete = image;
    deleteImageModel.imagePath = imagePath;
    
    __block typeof(self) bself = self;
    __weak typeof(self) wself = bself;
    deleteImageModel.completionBlock = ^(SKBaseModel *model) {
        [wself.deleteImageDict removeObjectForKey:((SKDeleteImageModel *)model).imagePath];
        
        // notify the image is uploaded successfully or not
        
        if (model.responseStatus == YES)
        {
            [[SKImageAssetManager sharedManager] deleteImageAtPath:imagePath];
        }
        else
        {
            
        }
    };
    
    [self.deleteImageDict setObject:deleteImageModel forKey:imagePath];

}

@end
