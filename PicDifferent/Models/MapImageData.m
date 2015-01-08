//
//  MapImageData.m
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "MapImageData.h"

@implementation MapImageData
-(MarkPosition*)markedOnMapAtPosition:(CGPoint)point
{
    if (point.x != NSNotFound  && point.y != NSNotFound) {
        for (MarkPosition *position in _listMarkPostions) {
            if (position && [position isContainedPoint:point]) {
                return position;
            }
        }
    }
    return nil;
}

-(void)updateMarkPositionBaseOnWidthRatio:(float)widthRatio andHeightRatio:(float)heightRatio
{
    if (_listMarkPostions && _listMarkPostions.count>0) {
        for (MarkPosition *position in _listMarkPostions) {
            if (position) {
                [position resizeBaseOnWidthRatio:widthRatio andHeightRatio:heightRatio];
            }
        }
    }
}

-(void)
@end
