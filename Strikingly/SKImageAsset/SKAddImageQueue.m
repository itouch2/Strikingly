//
//  SKAddImageQueue.m
//  Strikingly
//
//  Created by Tu You on 14-3-15.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "SKAddImageQueue.h"
#import "SKAddImageModel.h"
#import "SKImageAssetManager.h"

@interface SKAddImageQueue ()

@property (nonatomic, strong) NSMutableDictionary *addImageDict;

@end

@implementation SKAddImageQueue

- (void)addImage:(UIImage *)image withPath:(NSString *)imagePath
{
    if (!image || !imagePath)
    {
        return;
    }
    
    if ([self.addImageDict objectForKey:imagePath])
    {
        return;
    }
    
    SKAddImageModel *addImageModel = [[SKAddImageModel alloc] init];
    addImageModel.imageToAdd = image;
    addImageModel.imagePath = imagePath;
    
    __block typeof(self) bself = self;
    __weak typeof(self) wself = bself;
    addImageModel.completionBlock = ^(SKBaseModel *model) {
        [wself.addImageDict removeObjectForKey:((SKAddImageModel *)model).imagePath];
        
        // notify the image is uploaded successfully or not
        
        if (model.responseStatus == YES)
        {
            [[SKImageAssetManager sharedManager] addImageAtPath:imagePath];
        }
        else
        {
            
        }
    };
    
    [self.addImageDict setObject:addImageModel forKey:imagePath];
}


- (NSMutableDictionary *)addImageDict
{
    if (!_addImageDict)
    {
        _addImageDict = [NSMutableDictionary dictionary];
    }
    return _addImageDict;
}

@end
