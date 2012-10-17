//
//  InfoViewController.m
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/17.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

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
    
	// AD Banner View.
    CGFloat bannerHeight = 50;
    CGFloat viewHeight = self.view.frame.size.height;
    CGFloat navHeight = [[[self navigationController] rotatingHeaderView] frame].size.height;
    CGFloat adPosY = viewHeight - navHeight - bannerHeight;
    [[AdBannerManager sharedInstance] showAdBannerForRootViewCtr:self posY:adPosY];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
