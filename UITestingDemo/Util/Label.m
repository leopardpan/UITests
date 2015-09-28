//
//  Label.m
//  UITestingDemo
//
//  Created by 潘柏信 on 15/9/28.
//  Copyright © 2015年 leopardpan. All rights reserved.
//

#import "Label.h"

IB_DESIGNABLE
@implementation Label

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius  = _cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setBcolor:(UIColor *)bcolor{
    _bcolor = bcolor;
    self.layer.borderColor = _bcolor.CGColor;
}

- (void)setBwidth:(CGFloat)bwidth {
    _bwidth = bwidth;
    self.layer.borderWidth = _bwidth;
}


@end
