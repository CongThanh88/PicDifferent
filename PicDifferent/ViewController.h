//
//  ViewController.h
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchedImageView.h"
#import "CustomViews/CheckMarkListView.h"
#import "GADBannerView.h"

@interface ViewController : UIViewController<TouchedImageViewDelegate, GADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet TouchedImageView *leftImage;
@property (weak, nonatomic) IBOutlet CheckMarkListView *checkMarkListView;

@property (weak, nonatomic) IBOutlet TouchedImageView *rightImage;
@property (weak, nonatomic) IBOutlet GADBannerView *gabBannerView;
- (IBAction)btnRefresh:(id)sender;

@end

