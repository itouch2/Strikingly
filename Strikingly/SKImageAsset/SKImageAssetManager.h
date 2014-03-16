//
//  SKImageAssetManager.h
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKImageAssetManager : NSObject

+ (instancetype)sharedManager;

- (void)bindImageSets:(NSMutableArray *)imageSets;
- (void)deleteImageAtPath:(NSString *)imagePath;
- (void)addImageAtPath:(NSString *)imagePath;

@end
