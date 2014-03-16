//
//  SKAddImageModel.h
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKBaseModel.h"

@interface SKAddImageModel : SKBaseModel

@property (nonatomic, strong) UIImage *imageToAdd;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *imageId;

@end
