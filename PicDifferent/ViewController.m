//
//  ViewController.m
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)refreshGame
{
    [_leftImage refreshView];
    [_rightImage refreshView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    MapImageData *data1 = [[MapImageData alloc]init];
    MapImageData *data2 = [[MapImageData alloc]init];
    MarkPosition *position1 = [[MarkPosition alloc]init];
    position1.start_X = 100;
    position1.end_X = 140;
    position1.start_Y = 100;
    position1.end_Y = 140;
    
    MarkPosition *position2 = [[MarkPosition alloc]init];
    position2.start_X = 140;
    position2.end_X = 180;
    position2.start_Y = 200;
    position2.end_Y = 240;
    
    data1.listMarkPostions = [[NSArray alloc]initWithObjects:position1, position2, nil];
    data2.listMarkPostions = [[NSArray alloc]initWithObjects:position1, position2, nil];
    
    
    _leftImage.checkMap = data1;
    _leftImage.delegate = self;
    
    _rightImage.checkMap = data2;
    _rightImage.delegate = self;

}
#pragma mark - TouchedimageViewDelegate
-(void)touchedImageView:(TouchedImageView *)imageView markedOnFrame:(CGRect)frame
{
    if (imageView == _leftImage) {
        [_rightImage drawCircleOn:frame];
    }else{
        [_leftImage drawCircleOn:frame];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnRefresh:(id)sender {
    [self refreshGame];
}
@end
