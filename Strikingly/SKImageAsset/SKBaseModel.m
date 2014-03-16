//
//  SKBaseModel.m
//  Strikingly
//
//  Created by Tu You on 14-3-14.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "SKBaseModel.h"
#import "SKConfig.h"

@interface SKBaseModel ()

@property (nonatomic, strong) NSMutableData *receiveData;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableURLRequest *request;

@end

@implementation SKBaseModel

- (void)dealloc
{
    [self.connection cancel];
    self.completionBlock = nil;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.params = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark - Retrieve Data

- (void)getData
{
    if (self.isLoadingData)
    {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:SKServerPath];
    self.request = [[NSMutableURLRequest alloc] initWithURL:url];
    [self.request setHTTPMethod:@"post"];
    [self.request setHTTPBody:[self getParamsData]];
    self.connection = [[NSURLConnection alloc] initWithRequest:self.request delegate:self];
    [self.connection start];
    self.isLoadingData = YES;
}

- (NSData *)getParamsData
{
    NSMutableString *tmpPostBody = [NSMutableString string];
    [self.params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *tmp = [NSString stringWithFormat:@"%@=%@&", key, obj];
        [tmpPostBody appendString:tmp];
    }];
    NSString *postBody = [tmpPostBody substringToIndex:(tmpPostBody.length - 1)];
    return [postBody dataUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark - Connection Delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.receiveData = [NSMutableData data];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // parse the receive data to dict
    
    [self parseData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", [error localizedDescription]);
}

#pragma mark - Parse data

- (void)parseData
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:self.receiveData options:NSJSONReadingMutableLeaves error:nil];
        [self onParsedDict:responseDict];
    });
}

- (void)onParsedDict:(NSDictionary *)parsedDict
{
    int status = [[parsedDict objectForKey:@"status"] intValue];
    if (status == 200)
    {
        self.responseStatus = YES;
    }
    self.message = [parsedDict objectForKey:@"message"];
    
    [self handleData:parsedDict];
    
    [self onCompletion];
}

- (void)handleData:(NSDictionary *)parsedDict
{
    
}

- (void)onCompletion
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.isLoadingData = NO;
        if (self.completionBlock) {
            self.completionBlock(self);
        }
    });
}

@end
