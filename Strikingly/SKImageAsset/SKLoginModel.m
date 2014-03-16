//
//  SKLoginModel.m
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "SKLoginModel.h"
#import "NSDictionary+Utilities.h"

@implementation SKLoginModel

- (void)handleData:(NSDictionary *)parsedDict
{
    NSDictionary *dataDict = [parsedDict dictionaryForKey:@"data"];
    self.session = [dataDict stringForKey:@"session"];
}

@end
