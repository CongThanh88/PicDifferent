//
//  ViewController.m
//  PicDifferent
//
//  Created by Apple on 1/7/15.
//  Copyright (c) 2015 KhoiSang. All rights reserved.
//

#import "ViewController.h"
#import "GameLevel.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *gameLevels;
    NSInteger currentLevel;
}

-(void)refreshGame
{
    if (gameLevels) {
        currentLevel = (currentLevel+1)%gameLevels.count;
    }
    [_leftImage refreshView];
    [_rightImage refreshView];
    [_leftImage resetData];
    [_rightImage resetData];
    
    [self loadGame:currentLevel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    currentLevel = 0;
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *dictGameLevels = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GameData" ofType:@"plist"]];
    gameLevels = [GameLevel parseListData:dictGameLevels];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _leftImage.delegate = self;
    _rightImage.delegate = self;
    
    [self loadGame:currentLevel];
}

-(void)loadGame:(NSInteger)level
{
    if (gameLevels) {
        GameLevel *gameLevel = [gameLevels objectAtIndex:level];
        if (gameLevel) {
            [_checkMarkListView resetListCheckMark];
            
            _leftImage.image = [UIImage imageNamed:gameLevel.leftImage];
            _rightImage.image = [UIImage imageNamed:gameLevel.rightImage];
            
            _leftImage.data = gameLevel.gameData;
            _rightImage.data = gameLevel.gameData;
            
            _checkMarkListView.checkMarkNumber = gameLevel.gameData.listMarkPostions.count;
        }
    }
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
}
@end
