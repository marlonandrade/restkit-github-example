//
//  MARepositoryCell.h
//  RKGitHubExample
//
//  Created by Marlon Andrade on 09/03/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MARepository.h"

@interface MARepositoryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;
@property (weak, nonatomic) IBOutlet UILabel *watcherCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *forkCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *issueCountLabel;

@property (nonatomic, strong) MARepository *repository;

@end
