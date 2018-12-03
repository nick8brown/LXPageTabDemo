//
//  LXPageTabItemLable.m
//  XXPageTabDemo
//
//  Created by LX Zeng on 2017/3/3.
//  Copyright © 2017年   https://github.com/nick8brown   All rights reserved.
//

#import "LXPageTabItemLable.h"

@implementation LXPageTabItemLable

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if([_fillColor isKindOfClass:[UIColor class]]) {
        [_fillColor setFill];
        UIRectFillUsingBlendMode(CGRectMake(rect.origin.x, rect.origin.y, rect.size.width*_process, rect.size.height), kCGBlendModeSourceIn);
    }
}

- (void)setProcess:(CGFloat)process {
    _process = process;
    [self setNeedsDisplay];
}

@end
