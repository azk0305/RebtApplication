//
//  ColumnListPageViewController.m
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/11.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import "ColumnListPageViewController.h"

#import "ColumnPageViewController.h"

@interface ColumnListPageViewController ()

@end

@implementation ColumnListPageViewController

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
    
}

- (void) viewWillAppear:(BOOL)animated {
	// AD Banner View.
    CGFloat bannerHeight = 50;
    CGFloat viewHeight = self.view.frame.size.height;
    //CGFloat navHeight = [[[self navigationController] rotatingHeaderView] frame].size.height;
    //CGFloat adPosY = viewHeight - navHeight - bannerHeight;
    CGFloat adPosY = viewHeight - bannerHeight;
    [[AdBannerManager sharedInstance] showAdBannerForRootViewCtr:self posY:adPosY];
    
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *titles[] = {@"1. 論理療法について", @"2. アサーティブになる", @"3. 論理療法のABC理論"};
    return titles[row];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"readColumn"]) {
        ColumnPageViewController *cpViewController = [segue destinationViewController];
        cpViewController.selectedColumnNumber = [NSString stringWithFormat:@"%d", ([_pickerView selectedRowInComponent:0] + 1)];
    }
}

- (void) pickerView: (UIPickerView*)pView didSelectRow:(NSInteger) row  inComponent:(NSInteger)component {
    //int row1 = [_pickerView selectedRowInComponent:0];
    //NSLog(@"selected %d", row1);
}

- (IBAction)rcButtonClicked:(id)sender {
    //int row1 = [_pickerView selectedRowInComponent:0];
    //NSLog(@"selected %d", row1);
}

- (void)dealloc {
    [_pickerView release];
    [super dealloc];
}
@end
