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
        gameLevel.leftImage =  [ImageData parseData:[dict objectForKey:@"left_image"]];
        gameLevel.rightImage = [ImageData parseData:[dict objectForKey:@"right_image"]];
        return gameLevel;
    }
    return nil;
}

+(NSArray*)parseListData:(NSArray *)dictArray
{
    if (dictArray && dictArray.count>0) {
        NSArray *listGameLevels = [[NSArray alloc]init];
        for (NSDictionary *dictItem in dictArray) {
            if (dictItem) {
                GameLevel *gameLevel = [GameLevel parseData:dictItem];
                if (gameLevel) {
                    listGameLevels = [listGameLevels arrayByAddingObject:gameLevel];
                }
            }
        }
        return listGameLevels;
    }
    return nil;
}
@end
