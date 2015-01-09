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
{
    NSArray *gameLevels;
}

-(void)refreshGame
{
    [_leftImage refreshView];
    [_rightImage refreshView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    gameLevels = 
    _checkMarkListView.checkMarkNumber = 2;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _leftImage.delegate = self;
    _rightImage.delegate = self;
    
    [self loadGame];
}

-(void)loadGame
{
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
    
    MarkPosition *position3 = [[MarkPosition alloc]init];
    position3.start_X = 100;
    position3.end_X = 140;
    position3.start_Y = 100;
    position3.end_Y = 140;
    
    MarkPosition *position4 = [[MarkPosition alloc]init];
    position4.start_X = 140;
    position4.end_X = 180;
    position4.start_Y = 200;
    position4.end_Y = 240;
    
    data1.listMarkPostions = [[NSArray alloc]initWithObjects:position1, position2, nil];
    data2.listMarkPostions = [[NSArray alloc]initWithObjects:position3, position4, nil];
    
    _leftImage.checkMap = data1;
    _rightImage.checkMap = data2;
}

#pragma mark - TouchedimageViewDelegate
-(void)touchedImageView:(TouchedImageView *)imageView markedOnFrame:(CGRect)frame
{
    [_checkMarkListView addCheckedMark];
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
    [_checkMarkListView resetListCheckMark];
}
@end
