//
//  MARepository.h
//  RKGitHubExample
//
//  Created by Marlon Andrade on 09/03/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MARepository : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *ownerName;
@property (nonatomic, copy) NSString *ownerAvatarUrl;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSNumber *watchers;
@property (nonatomic, copy) NSNumber *forks;
@property (nonatomic, copy) NSNumber *issues;

+ (RKMapping *)mapping;

@end
