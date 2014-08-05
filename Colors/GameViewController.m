//
//  GameViewController.m
//  Colors
//
//  Created by Cody Mace on 12/16/13.
//  Copyright (c) 2013 Cody Mace. All rights reserved.
//

#import "GameViewController.h"
#import "ColorButton.h"
#import "GameOverView.h"

@interface GameViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) IBOutletCollection(ColorButton) NSArray *buttons;
@property (strong, nonatomic) NSArray *colorArray;
@property (assign, nonatomic) NSInteger indexToMatch;
@property (assign, nonatomic) double timePassed;
@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) GameOverView *gameOverView;

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    [self shuffleButtons];
    self.gameOverView = [[GameOverView alloc] initWithFrame:self.view.frame];
    self.gameOverView.hidden = YES;
    [self.view addSubview:self.gameOverView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(againButtonPressed) name:@"againButtonPressed" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(quitButtonPressed) name:@"quitButtonPressed" object:nil];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    [self.buttons enumerateObjectsUsingBlock:^(ColorButton *button, NSUInteger idx, BOOL *stop) {
        [button setTranslatesAutoresizingMaskIntoConstraints:YES];
        CGFloat x;
        if (button.tag % 2 == 0)
        {
            x = 0;
        }
        else
        {
            x = screenWidth/2.0;
        }
        CGFloat y = (button.tag / 2) * (screenHeight/4.0);

        [button setFrame:CGRectMake(x, y, screenWidth/2.0, screenHeight/4.0)];
        [button.titleLabel setFont:[UIFont fontWithName:@"Optima-ExtraBlack" size:self.view.frame.size.width/16]];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(ColorButton *)button
{
    if (button.toMatch == NO)
    {
        if (button.index == 7)
        {
            [button setColorIndex:0];
        }
        else
        {
            [button setColorIndex:button.index + 1];
        }
        [self checkForWin];
    }
}

- (void)checkForWin
{
    NSInteger correct = 0;
    for (ColorButton *button in self.buttons)
    {
        NSLog(@"index: %d", button.index);
        NSLog(@"to match: %d", self.indexToMatch);
        if (button.index == self.indexToMatch)
        {
            correct += 1;
            NSLog(@"Correct: %d", correct);
        }
    }
    if (correct == 8)
    {
        [self.timer invalidate];
        self.gameOverView.hidden = NO;
        if (self.indexToMatch != 1) {
            [self.gameOverView.againButton setBackgroundColor:[UIColor colorWithRed:168/255.0 green:230/255.0 blue:1 alpha:1]];
        } else {
            [self.gameOverView.againButton setBackgroundColor:[UIColor colorWithRed:221/255.0 green:203/255.0 blue:1 alpha:1]];
        }
        if (self.indexToMatch != 2) {
            [self.gameOverView.quitButton setBackgroundColor:[UIColor colorWithRed:1 green:198/255.0 blue:210/255.0 alpha:1]];
        } else {
            [self.gameOverView.quitButton setBackgroundColor:[UIColor colorWithRed:248/255.0 green:183/255.0 blue:119/255.0 alpha:1]];
        }
        self.gameOverView.scoreLabel.text = [NSString stringWithFormat:@"%.02f", self.timePassed];
        [self.buttons enumerateObjectsUsingBlock:^(ColorButton *button, NSUInteger idx, BOOL *stop) {
            [button setTitle:@"" forState:UIControlStateNormal];
        }];
    }
}

- (void)againButtonPressed {
    self.gameOverView.hidden = YES;
    [self.timer fire];
    [self shuffleButtons];
}
- (void)quitButtonPressed {
    self.gameOverView.hidden = YES;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)shuffleButtons
{
    NSInteger matchIndex = (NSInteger)arc4random_uniform(8);
    self.indexToMatch = matchIndex;
    NSMutableArray *shuffleArray = [[NSMutableArray alloc] init];
    for (ColorButton *button in self.buttons)
    {
        [shuffleArray addObject:button];
    }
    for (NSInteger i=0; i<shuffleArray.count; i++)
    {
        NSInteger m = (NSInteger)arc4random_uniform(8);
        NSInteger n = (NSInteger)arc4random_uniform(8);
        [shuffleArray exchangeObjectAtIndex:m withObjectAtIndex:n];
    }
    for (NSInteger j=0; j<shuffleArray.count; j++)
    {
        ColorButton *button = [shuffleArray objectAtIndex:j];
        button.index = j;
        if (j == self.indexToMatch)
        {
            button.toMatch = YES;
        }
        else
        {
            button.toMatch = NO;
        }
        [button setColorIndex:j];
    }
    self.timePassed = 0;
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    self.timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
    [runloop addTimer:self.timer forMode:NSRunLoopCommonModes];
    [runloop addTimer:self.timer forMode:UITrackingRunLoopMode];
}

- (void)updateTime:(NSTimeInterval)interval
{
    for (ColorButton *button in self.buttons)
    {
        if (button.toMatch && self.timePassed > 0.9)
        {
            [button setTitle:[NSString stringWithFormat:@"%.02f", self.timePassed] forState: UIControlStateNormal];
        }
    }
    self.timePassed += .01;
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self shuffleButtons];
    }
}
@end
