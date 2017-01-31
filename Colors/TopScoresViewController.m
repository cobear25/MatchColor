//
//  TopScoresViewController.m
//  Colors
//
//  Created by Cody Mace on 8/3/14.
//  Copyright (c) 2014 Cody Mace. All rights reserved.
//

#import "TopScoresViewController.h"
#import "GameCenterManager.h"

@interface TopScoresViewController ()
@property (weak, nonatomic) IBOutlet UILabel *score1Label;
@property (weak, nonatomic) IBOutlet UILabel *score2Label;
@property (weak, nonatomic) IBOutlet UILabel *score3Label;
@property (weak, nonatomic) IBOutlet UILabel *score4Label;
@property (weak, nonatomic) IBOutlet UILabel *score5Label;
@property (weak, nonatomic) IBOutlet UIButton *gameCenterButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation TopScoresViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.gameCenterButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.gameCenterButton.layer.cornerRadius = 8;
    self.doneButton.layer.cornerRadius = 8;

    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"topscores"] != NULL) {
        NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"topscores"];
        self.score1Label.text = [NSString stringWithFormat:@"%.02f", [[array objectAtIndex:0] doubleValue]];
        if (array.count >= 2) {
            self.score2Label.text = [NSString stringWithFormat:@"%.02f", [[array objectAtIndex:1] doubleValue]];
        }
        if (array.count >= 3) {
            self.score3Label.text = [NSString stringWithFormat:@"%.02f", [[array objectAtIndex:2] doubleValue]];
        }
        if (array.count >= 4) {
            self.score4Label.text = [NSString stringWithFormat:@"%.02f", [[array objectAtIndex:3] doubleValue]];
        }
        if (array.count >= 5) {
            self.score5Label.text = [NSString stringWithFormat:@"%.02f", [[array objectAtIndex:4] doubleValue]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gameCenterButtonTapped:(id)sender {
    [[GameCenterManager sharedManager] presentLeaderboardsOnViewController:self];
}
- (IBAction)doneButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}


@end
