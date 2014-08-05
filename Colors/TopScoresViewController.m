//
//  TopScoresViewController.m
//  Colors
//
//  Created by Cody Mace on 8/3/14.
//  Copyright (c) 2014 Cody Mace. All rights reserved.
//

#import "TopScoresViewController.h"

@interface TopScoresViewController ()
@property (weak, nonatomic) IBOutlet UILabel *score1Label;
@property (weak, nonatomic) IBOutlet UILabel *score2Label;
@property (weak, nonatomic) IBOutlet UILabel *score3Label;
@property (weak, nonatomic) IBOutlet UILabel *score4Label;
@property (weak, nonatomic) IBOutlet UILabel *score5Label;
@property (weak, nonatomic) IBOutlet UIButton *gameCenterButton;

@end

@implementation TopScoresViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.gameCenterButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gameCenterButtonTapped:(id)sender {
}
- (IBAction)doneButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}


@end
