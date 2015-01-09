//
//  GameLevel.m
//  PicDifferent
//
//  Created by Apple on 1/9/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "GameLevel.h"

@implementation GameLevel
+(GameLevel*)parseData:(NSDictionary*)dict
{
    if (dict) {
        GameLevel *gameLevel = [[GameLevel alloc]init];
        gameLevel.leftImage = [dict objectForKey:@"left_image"];
        gameLevel.rightImage = [dict objectForKey:@"right_image"];
        gameLevel.checkedMap = []
    }
}
@end
