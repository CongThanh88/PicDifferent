//
//  LeftImageData.h
//  PicDifferent
//
//  Created by Cong Thanh on 1/9/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapImageData.h"

@interface ImageData : NSObject
@property(nonatomic,strong)NSString *imageName;
@property(nonatomic,strong)MapImageData *checkedMap;

+(ImageData*)parseData:(NSDictionary*)dict;
@end
