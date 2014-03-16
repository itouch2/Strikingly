//
//  SKBaseModel.h
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SKBaseModel;

typedef void(^SKModelCompletionBlock)(SKBaseModel *model);

@interface SKBaseModel : NSObject

@property (nonatomic, copy) SKModelCompletionBlock completionBlock;
@property (nonatomic, strong) NSMutableDictionary *params;

@property (nonatomic, assign) BOOL isLoadingData;
@property (nonatomic, assign) BOOL responseStatus;

@property (nonatomic, strong) NSString *message;

- (void)getData;
- (void)handleData:(NSDictionary *)parsedDict;

@end

