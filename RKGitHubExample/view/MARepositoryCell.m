//
//  MARepositoryCell.m
//  RKGitHubExample
//
//  Created by Marlon Andrade on 09/03/13.
//  Copyright (c) 2013 Marlon Andrade. All rights reserved.
//

#import "MARepositoryCell.h"

#import <QuartzCore/QuartzCore.h>

#define DEGREES_TO_RADIANS(degrees) ((degrees * M_PI) / 180.f)
#define LANGUAGE_LABEL_TRANSFORM CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(45.f))

@interface MARepositoryCell ()

@property (nonatomic, assign) BOOL initialized;
- (void)_initializeCell;

@end

@implementation MARepositoryCell

#pragma mark - Setter

- (void)setRepository:(MARepository *)repository {
    if (repository != _repository) {
        _repository = repository;

        self.nameLabel.text = _repository.name;
        self.descriptionLabel.text = _repository.description;

        self.languageLabel.text = _repository.language.uppercaseString;
        if ([self.languageLabel.text isEqualToString:@"OBJECTIVE-C"]) {
            self.languageLabel.text = @"OBJ-C";
        }

        self.watcherCountLabel.text = _repository.watchers.stringValue;
        self.forkCountLabel.text = _repository.forks.stringValue;
        self.issueCountLabel.text = _repository.issues.stringValue;
    }
}

#pragma mark - Overriden Methods

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initializeCell];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _initializeCell];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.initialized) {
        self.languageLabel.layer.borderWidth = 1.f;
        self.languageLabel.layer.borderColor = [UIColor colorWithWhite:0.761 alpha:1.000].CGColor;
        self.languageLabel.transform = LANGUAGE_LABEL_TRANSFORM;
        self.initialized = YES;
    }
}

#pragma mark - Initialize Cell

- (void)_initializeCell {
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_background"]];
}

@end
