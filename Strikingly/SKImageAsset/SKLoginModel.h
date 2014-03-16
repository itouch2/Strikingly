//
//  SKLoginModel.h
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKBaseModel.h"

@interface SKLoginModel : SKBaseModel

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, copy) NSString *session;

@end
