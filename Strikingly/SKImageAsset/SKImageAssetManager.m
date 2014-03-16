//
//  SKImageAssetManager.m
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "SKImageAssetManager.h"

static SKImageAssetManager *manager;

@interface SKImageAssetManager ()

@property (nonatomic, copy) NSString *session;
@property (atomic, retain) NSMutableArray *imageSets;

@end

@implementation SKImageAssetManager

+ (instancetype)sharedManager
{
    dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (id)init
{
    if (self = [super init])
    {
        self.imageSets = [NSMutableArray array];
    }
    return self;
}

- (void)bindImageSets:(NSMutableArray *)imageSets
{
    self.imageSets = imageSets;
}

- (void)addImageAtPath:(NSString *)imagePath
{
    
}

- (void)deleteImageAtPath:(NSString *)imagePath
{
    
}

@end
