//
//  AdBannerManager.h
//
//  Copyright 2012 Shuichi Tsutsumi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AdBannerManager : NSObject

+ (id)sharedInstance;

- (void)showAdBannerForRootViewCtr:(UIViewController *)viewCtr
                              posY:(CGFloat)posY;
- (void)removeAdBannerFromSuperview;

@end
