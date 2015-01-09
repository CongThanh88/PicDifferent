//
//  GameLevel.h
//  PicDifferent
//
//  Created by Apple on 1/9/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageData.h"

@interface GameLevel : NSObject
@property(nonatomic,strong)ImageData *leftImage;
@property(nonatomic,strong)ImageData *rightImage;
+(GameLevel*)parseData:(NSDictionary*)dict;
+(NSArray*)parseListData:(NSArray*)dictArray;
@end
