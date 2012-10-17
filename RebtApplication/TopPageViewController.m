//
//  TopPageViewController.m
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/11.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import "TopPageViewController.h"

@interface TopPageViewController ()

@end

@implementation TopPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    CGFloat bannerHeight = 50;
    CGFloat viewHeight = self.view.frame.size.height;
    CGFloat navHeight = [[[self navigationController] rotatingHeaderView] frame].size.height;
    CGFloat adPosY = viewHeight - navHeight - bannerHeight;
    [[AdBannerManager sharedInstance] showAdBannerForRootViewCtr:self posY:adPosY];
/*
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    
    adView.frame = CGRectOffset(adView.frame, 0, adPosY);
    
    [self.view addSubview:adView];
    adView.delegate = self;
    
    //NSLog(@"%f",self.view.frame.size.height);
*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}

/*
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError*)error
{
}
*/

@end
