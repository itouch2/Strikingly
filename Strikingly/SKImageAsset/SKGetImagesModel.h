//
//  SKRetrieveDataModel.h
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKBaseModel.h"

@interface SKImageInfo : NSObject

@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NSString *imageId;

@end

@interface SKImageSet : NSObject

@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSMutableArray *assetImages;
@property (nonatomic, assign) int size;

@end

@interface SKGetImagesModel : SKBaseModel

@property (nonatomic, strong) NSMutableArray *imageSets;

@end


