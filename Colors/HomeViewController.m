//
//  HomeViewController.m
//  Colors
//
//  Created by Cody Mace on 7/29/14.
//  Copyright (c) 2014 Cody Mace. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *topScoresButton;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.topScoresButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.playButton.frame = CGRectMake(self.view.frame.size.width/2 - self.playButton.frame.size.width/2, self.view.frame.size.height/2 - self.playButton.frame.size.height/2, self.playButton.frame.size.width, self.playButton.frame.size.height);
    self.navigationController.navigationBarHidden = YES;
}

@end
