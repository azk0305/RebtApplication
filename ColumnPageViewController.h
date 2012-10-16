//
//  ColumnPageViewController.h
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/11.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColumnPageViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIWebView *columWebView;
@property (retain, nonatomic) NSString *selectedColumnNumber;

@end
