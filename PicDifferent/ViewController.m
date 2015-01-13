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
    GADBannerView *gadBannerView;
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
    CGSize screenSize = [UIScreen  mainScreen].bounds.size;
    CGRect bannerFrame = CGRectMake(0, screenSize.height - 32, screenSize.width, 32);
    // Replace this ad unit ID with your own ad unit ID.
    gadBannerView = [[DFPBannerView alloc]initWithFrame:bannerFrame];
    gadBannerView.adUnitID = @"/6499/example/banner";//@"ca-app-pub-7643684312776612/8787977481";
    gadBannerView.rootViewController = self;
    gadBannerView.adSize = kGADAdSizeSmartBannerLandscape;
    [self.view addSubview:gadBannerView];
    
    GADRequest *request = [GADRequest request];
    [gadBannerView loadRequest:request];
    
    
    
    NSArray *dictGameLevels = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GameData" ofType:@"plist"]];
    gameLevels = [GameLevel parseListData:dictGameLevels];
}

#pragma Mark - GADBannerViewDelegate
/// Called when an ad request loaded an ad. This is a good opportunity to add this view to the
/// hierarchy if it has not been added yet. If the ad was received as a part of the server-side auto
/// refreshing, you can examine the hasAutoRefreshed property of the view.
- (void)adViewDidReceiveAd:(GADBannerView *)view
{
    [self.view addSubview:view];
}

/// Called when an ad request failed. Normally this is because no network connection was available
/// or no ads were available (i.e. no fill). If the error was received as a part of the server-side
/// auto refreshing, you can examine the hasAutoRefreshed property of the view.
- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{
    
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
