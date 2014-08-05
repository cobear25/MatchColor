//
//  GameOverView.m
//  Colors
//
//  Created by Cody Mace on 7/8/14.
//  Copyright (c) 2014 Cody Mace. All rights reserved.
//

#import "GameOverView.h"

@interface GameOverView()

@property UILabel *doneLabel;

@end

@implementation GameOverView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSInteger buttonWidth = frame.size.width/2.5;
        NSInteger buttonRadius = buttonWidth/2;
        NSInteger viewWidth = frame.size.width;
        NSInteger viewHeight = frame.size.height;
        NSInteger buttonFontSize = viewWidth/16;

        // Create again button
        self.againButton = [[UIButton alloc] initWithFrame:CGRectMake(viewWidth/2 - buttonRadius, viewHeight/2-buttonRadius, buttonWidth, buttonWidth)];
        [self.againButton setTitle:@"Go Again" forState:UIControlStateNormal];
        self.againButton.backgroundColor = [UIColor colorWithRed:0.1 green:1.0 blue:0.1 alpha:0.5];
        [self.againButton addTarget:self action:@selector(againButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        self.againButton.titleLabel.font = [UIFont fontWithName:@"Optima-ExtraBlack" size:buttonFontSize];
        [self addSubview:self.againButton];

        // Create quit button
        self.quitButton = [[UIButton alloc] initWithFrame:CGRectMake(viewWidth/2 - buttonRadius, self.againButton.frame.origin.y + buttonRadius*2 + 15, buttonWidth, buttonWidth)];
        [self.quitButton setTitle:@"Quit" forState:UIControlStateNormal];
        self.quitButton.backgroundColor = [UIColor colorWithRed:1.0 green:0.1 blue:0.1 alpha:0.5];
        [self.quitButton addTarget:self action:@selector(quitButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        self.quitButton.titleLabel.font = [UIFont fontWithName:@"Optima-ExtraBlack" size:buttonFontSize];
        [self addSubview:self.quitButton];

        // Create done label
        self.doneLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewWidth/2 - viewWidth/3, self.frame.origin.y+40, viewWidth/1.5, 100)];
        self.doneLabel.text = @"Done!";
        self.doneLabel.textAlignment = NSTextAlignmentCenter;
        self.doneLabel.textColor = [UIColor darkGrayColor];
        self.doneLabel.font = [UIFont fontWithName:@"Optima-ExtraBlack" size:60];
        [self addSubview:self.doneLabel];

        // Create score label
        self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewWidth/2 - viewWidth/3, self.doneLabel.frame.origin.y + 50, viewWidth/1.5, 100)];
        self.scoreLabel.textAlignment = NSTextAlignmentCenter;
        self.scoreLabel.textColor = [UIColor darkGrayColor];
        self.scoreLabel.font = [UIFont fontWithName:@"Optima-ExtraBlack" size:30];
        [self addSubview:self.scoreLabel];
    }
    return self;
}

- (void)againButtonPressed {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"againButtonPressed" object:self];
}
- (void)quitButtonPressed {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"quitButtonPressed" object:self];
}
@end
