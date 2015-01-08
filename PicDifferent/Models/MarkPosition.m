//
//  MarkPosition.m
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "MarkPosition.h"

@implementation MarkPosition
-(BOOL)isContainedPoint:(CGPoint)point
{
    if (point.x != NSNotFound && point.y != NSNotFound) {
        if (point.x >= _start_X && point.x <= _end_X && point.y >= _start_Y && point.y <= _end_Y) {
            return YES;
        }
    }
    return NO;
}

-(CGRect)frame
{
    float width = ABS(_end_X - _start_X);
    float height = ABS(_end_Y - _start_Y);
    float minSize = MAX(width, height);
    float position_X = _start_X + (_end_X - _start_X)/2;
    float position_Y = _start_Y + (_end_Y - _start_Y)/2;
    
    return CGRectMake(position_X, position_Y, minSize, minSize);
}

-(void)resizeBaseOnWidthRatio:(float)widthRatio andHeightRatio:(float)heightRatio
{
    _start_X =  _start_X + (_start_X*widthRatio);
    _end_X = _end_X + (_end_X*widthRatio);
    _start_Y = _start_Y + (_start_Y*heightRatio);
    _end_Y = _end_Y + (_end_Y*heightRatio);
}

-(void)printPosition
{
    NSLog(@"Position-- x:%f y:%F endX:%f)
}
@end
