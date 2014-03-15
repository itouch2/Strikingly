//
//  NSDictionary+Utilities.m
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "NSDictionary+Utilities.h"

@implementation NSDictionary (Utilities)


- (NSArray *)arrayForKey:(NSString *)key
{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSArray class]])
    {
        return obj;
    }
    else
    {
        return nil;
    }
}

- (NSDictionary *)dictionaryForKey:(NSString *)key
{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        return obj;
    }
    else
    {
        return nil;
    }

}
- (NSString *)stringForKey:(NSString *)key
{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSString class]])
    {
        return obj;
    }
    else
    {
        return nil;
    }

}

@end
