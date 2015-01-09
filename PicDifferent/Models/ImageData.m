//
//  LeftImageData.m
//  PicDifferent
//
//  Created by Cong Thanh on 1/9/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "ImageData.h"

@implementation ImageData
+(ImageData*)parseData:(NSDictionary*)dict
{
    if (dict) {
        ImageData *imageData = [[ImageData alloc]init];
        imageData.imageName = [dict objectForKey:@"name"];
        imageData.checkedMap = [MapImageData parseData:[dict objectForKey:@"checked_marks"]];
        //Update position
        CGSize realSize = [self getRealSize];
        CGSize imageSize = [self imageSize:imageData.imageName];
        float ratioWidth = (realSize.width - imageSize.width)/imageSize.width;
        float ratioHeight = (realSize.height - imageSize.height)/imageSize.height;
        [imageData.checkedMap updateMarkPositionBaseOnWidthRatio:ratioWidth andHeightRatio:ratioHeight];
        return imageData;
    }
    return nil;
}

+(CGSize)imageSize:(NSString*)imageName
{
    if (imageName) {
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            return image.size;
        }
    }
    return CGSizeZero;
}

+(CGSize)getRealSize
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    float imageViewWidth = (screenSize.width - 8)/2;
    float imageViewHeight = screenSize.height - 42;
    return  CGSizeMake(imageViewWidth, imageViewHeight);
}

@end
