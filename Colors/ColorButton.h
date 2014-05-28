//
//  ColorButton.h
//  Colors
//
//  Created by Cody Mace on 5/22/14.
//  Copyright (c) 2014 Cody Mace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorButton : UIButton

@property (assign, nonatomic) NSInteger index;
@property (assign, nonatomic) BOOL toMatch;

- (void)setColorIndex:(NSInteger)currentColorIndex;

@end
