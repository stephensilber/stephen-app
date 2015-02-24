//
//  SSConnectionManager.m
//  stephen
//
//  Created by Stephen Silber on 2/23/15.
//  Copyright (c) 2015 stephensilber. All rights reserved.
//

#import "SSConnectionManager.h"

#import <AFNetworking/AFNetworking.h>

@implementation SSConnectionManager

static NSString *const baseUrl = @"https://silber.herokuapp.com/api/v1/";

+ (SSConnectionManager *)manager
{
    static SSConnectionManager *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"stephen iOS 1.0"}];
        
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                          diskCapacity:50 * 1024 * 1024
                                                              diskPath:nil];
        
        [config setURLCache:cache];
        
        _sharedClient = [[SSConnectionManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl] sessionConfiguration:config];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
    
    if (self)
    {
        
    }
    
    return self;
}

@end
