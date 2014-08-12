//
//  GameOverView.h
//  Colors
//
//  Created by Cody Mace on 7/8/14.
//  Copyright (c) 2014 Cody Mace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameOverView : UIView

@property UILabel *scoreLabel;
@property UIButton *againButton;
@property UIButton *quitButton;

- (void)loadAd;
- (void)showAd;
- (void)removeAd;
@end
