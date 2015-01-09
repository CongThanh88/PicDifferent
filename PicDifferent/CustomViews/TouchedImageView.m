//
//  TouchedImageView.m
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "TouchedImageView.h"

@implementation TouchedImageView
{
    CGSize imageSize;
    CGSize realSize;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *aTouch = [touches anyObject];
    CGPoint point = [aTouch locationInView:self];
    point = [self convertPoint:point toView:self];
    MarkPosition *markedPosition = [_checkMap markedOnMapAtPosition:point];
    if (markedPosition) {
        [self drawCircleOn:[markedPosition markFrame]];
        if (_delegate && [_delegate respondsToSelector:@selector(touchedImageView:markedOnFrame:)]) {
            [_delegate touchedImageView:self markedOnFrame:[markedPosition markFrame]];
        }
    }
}

-(void)drawCircleOn:(CGRect)frame;
{
    UIImageView *checkMarkView = [[UIImageView alloc]initWithFrame:frame];
    checkMarkView.image = [UIImage imageNamed:@"ic_circle_check_mark.png"];
    [self addSubview:checkMarkView];
}

-(void)refreshView
{
    for (UIView *childView in self.subviews) {
        if (childView) {
            [childView removeFromSuperview];
        }
    }
}

-(void)setCheckMap:(MapImageData *)checkMap
{
    if (checkMap) {
        _checkMap = checkMap;
        [self resizeView];
    }
}


-(void)resizeView
{
    if (self.image) {
        imageSize = self.image.size;
    }
    if (imageSize.width != 0 && imageSize.height !=0 ) {
        realSize = self.frame.size;
        float ratioWidth = (realSize.width - imageSize.height)/imageSize.height;
        float ratioHeight = (realSize.height - imageSize.width)/imageSize.width;
        [_checkMap updateMarkPositionBaseOnWidthRatio:ratioWidth andHeightRatio:ratioHeight];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
