//
//  MARepository.m
//  RKGitHubExample
//
//  Created by Marlon Andrade on 09/03/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import "MARepository.h"

@implementation MARepository

+ (RKMapping *)mapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[MARepository class]];

    [mapping addAttributeMappingsFromDictionary:@{
        @"name": @"name",
        @"owner.login": @"ownerName",
        @"owner.avatar_url": @"ownerAvatarUrl",
        @"description": @"description",
        @"language": @"language",
        @"watchers_count": @"watchers",
        @"forks_count": @"forks",
        @"open_issues_count": @"issues"
    }];

    return mapping;
}

@end
