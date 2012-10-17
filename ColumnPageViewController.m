//
//  ColumnPageViewController.m
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/11.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import "ColumnPageViewController.h"

@interface ColumnPageViewController ()

@end

@implementation ColumnPageViewController

@synthesize selectedColumnNumber;

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
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@%@", @"column", selectedColumnNumber] ofType:@"html" inDirectory:NO];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [self.columWebView loadRequest:request];
    
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

- (void)dealloc {
    [_columWebView release];
    [selectedColumnNumber release];
    [super dealloc];
}
@end
