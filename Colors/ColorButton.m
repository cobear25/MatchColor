//
//  ColorButton.m
//  Colors
//
//  Created by Cody Mace on 5/22/14.
//  Copyright (c) 2014 Cody Mace. All rights reserved.
//

#import "ColorButton.h"

@interface ColorButton()

@property (strong, nonatomic) NSArray *colorArray;
@property (strong, nonatomic) UIColor *color;

@end

@implementation ColorButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.colorArray = @[[UIColor whiteColor], //0-White
                            [UIColor colorWithRed:168/255.0 green:230/255.0 blue:1 alpha:1], //1-Blue
                            [UIColor colorWithRed:1 green:198/255.0 blue:210/255.0 alpha:1], //2-Pink
                            [UIColor colorWithRed:201/255.0 green:1 blue:217/255.0 alpha:1], //3-Green
                            [UIColor colorWithRed:248/255.0 green:183/255.0 blue:119/255.0 alpha:1], //4-Orange
                            [UIColor colorWithRed:1 green:1 blue:200/255.0 alpha:1], //5-Yellow
                            [UIColor colorWithRed:194/255.0 green:150/255.0 blue:121/255.0 alpha:1], //6-Brown
                            [UIColor colorWithRed:221/255.0 green:203/255.0 blue:1 alpha:1]]; //7-Purple
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}
- (void)setColorIndex:(NSInteger)index
{
    self.color = [self.colorArray objectAtIndex:index];
    self.backgroundColor = self.color;
    self.index = index;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    if (self.toMatch)
    {
        [self setTitle:@"Match Me" forState:UIControlStateNormal];
    }
    else
    {
        [self setTitle:[NSString stringWithFormat:@"", self.index] forState:UIControlStateNormal];
    }
}
@end
