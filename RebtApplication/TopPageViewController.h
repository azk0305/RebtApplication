//
//  TopPageViewController.h
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/11.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <iAd/iAd.h>
#import "NADView.h"

@interface TopPageViewController : UIViewController<ADBannerViewDelegate, NADViewDelegate> {
    //iAd
    ADBannerView *adView;
    BOOL iAdBannerIsVisible;
    
    //nand
    NADView *nadView;
    BOOL nandBannerIsVisible;
}

@property (nonatomic, assign) BOOL iAdBannerIsVisible;
@property (nonatomic, assign) BOOL nandBannerIsVisible;
    
@end
