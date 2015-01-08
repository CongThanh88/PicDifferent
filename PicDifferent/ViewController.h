//
//  ViewController.h
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchedImageView.h"

@interface ViewController : UIViewController<TouchedImageViewDelegate>
@property (weak, nonatomic) IBOutlet TouchedImageView *leftImage;

@property (weak, nonatomic) IBOutlet TouchedImageView *rightImage;
- (IBAction)btnRefresh:(id)sender;

@end

