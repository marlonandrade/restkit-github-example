//
//  MARepositoryListController.m
//  RKGitHubExample
//
//  Created by Marlon Andrade on 09/03/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import "MARepositoryListController.h"

#import "MARepository.h"
#import "MARepositoryCell.h"

static NSString *REPOSITORY_IDENTIFIER = @"repository_row";

@interface MARepositoryListController ()

@property (nonatomic, strong) NSArray *repositories;

- (void)_loadRepositories;

@end

@implementation MARepositoryListController

#pragma mark - Setter

- (void)setRepositories:(NSArray *)repositories {
    if (repositories != _repositories) {
        _repositories = repositories;
        [self.tableView reloadData];
    }
}

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _loadRepositories];
}

#pragma mark - Private Interface

- (void)_loadRepositories {
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);

    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[MARepository mapping]
                                                                                       pathPattern:nil
                                                                                           keyPath:nil
                                                                                       statusCodes:statusCodes];
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/orgs/RestKit/repos"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    RKObjectRequestOperation *requestOperation = [[RKObjectRequestOperation alloc] initWithRequest:urlRequest
                                                                               responseDescriptors:@[responseDescriptor]];
    [requestOperation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        self.repositories = mappingResult.array;
    } failure:NULL];

    [requestOperation start];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repositories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MARepositoryCell *cell = [self.tableView dequeueReusableCellWithIdentifier:REPOSITORY_IDENTIFIER];
    cell.repository = [self.repositories objectAtIndex:indexPath.row];

    return cell;
}

#pragma mark - UITableViewDelegate Methods

@end