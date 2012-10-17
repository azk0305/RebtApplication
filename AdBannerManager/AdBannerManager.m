//
//  AdBannerManager.m
//
//  Copyright 2012 Shuichi Tsutsumi. All rights reserved.
//

#import "AdBannerManager.h"
#import <iAd/iAd.h>
#import "NADView.h"

#ifndef AH_RETAIN
#if __has_feature(objc_arc)
#define AH_RETAIN(x) x
#define AH_RELEASE(x)
#define AH_AUTORELEASE(x) x
#define AH_SUPER_DEALLOC
#else
#define __AH_WEAK
#define AH_WEAK assign
#define AH_RETAIN(x) [x retain]
#define AH_RELEASE(x) [x release]
#define AH_AUTORELEASE(x) [x autorelease]
#define AH_SUPER_DEALLOC [super dealloc]
#endif
#endif



@interface AdBannerManager ()
<ADBannerViewDelegate, NADViewDelegate>
{
    BOOL iAdFailed;
}
#if !__has_feature(objc_arc)
@property (nonatomic, retain) ADBannerView *iAdView;
@property (nonatomic, retain) NADView *nadView;
@property (nonatomic, retain) UIViewController *currentRootViewCtr;
#else
@property (nonatomic, strong) ADBannerView *iAdView;
@property (nonatomic, strong) NADView *nadView;
@property (nonatomic, strong) UIViewController *currentRootViewCtr;
#endif
- (void)initFile;
@end



@implementation AdBannerManager

@synthesize iAdView = _iAdView;
@synthesize nadView;
@synthesize currentRootViewCtr = _currentRootViewCtr;


static id instance = nil;

+ (id)sharedInstance {
    @synchronized(self) {
        if (!instance) {
            instance = [[self alloc] init];
			[instance initFile];
        }
    }
	return instance;
}


- (void)initFile {

#if !__has_feature(objc_arc)
    self.iAdView = [[[ADBannerView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)] autorelease];
#else
    self.iAdView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
#endif
    self.iAdView.backgroundColor = [UIColor clearColor];
	self.iAdView.delegate=self;
}


- (void)dealloc {
#if !__has_feature(objc_arc)
    self.iAdView = nil;
    self.nadView = nil;
    [super dealloc];
#endif
}


#pragma mark -------------------------------------------------------------------
#pragma mark Private

- (void)showNADBannerAtView:(UIView *)targetView posY:(CGFloat)posY {

    if (!self.nadView) {
#if !__has_feature(objc_arc)
        self.nadView = [[[NADView alloc] initWithFrame:
                         CGRectMake(0,0,
                                    NAD_ADVIEW_SIZE_320x50.width,
                                    NAD_ADVIEW_SIZE_320x50.height)] autorelease];
        [self.nadView setNendID:kNendAPIKey spotID:kNendSpotID];
        self.nadView.delegate = self;
#else
        self.nadView = [[NADView alloc] initWithFrame:
                        CGRectMake(0,0,
                                   NAD_ADVIEW_SIZE_320x50.width,
                                   NAD_ADVIEW_SIZE_320x50.height)];
        [self.nadView setNendID:kNendAPIKey spotID:kNendSpotID];
        self.nadView.delegate = self;
#endif
        
        self.nadView.rootViewController = self.currentRootViewCtr;
        [self.nadView load];
    }
    

    
    if (self.iAdView.superview) {
        [self.iAdView removeFromSuperview];
    }    

    // NEND
    if (![self.nadView.superview isEqual:targetView]) {
        
        [self.nadView pause];
        [self.nadView removeFromSuperview];

        self.nadView.rootViewController = self.currentRootViewCtr;

        CGRect newFrame = self.nadView.frame;
        newFrame.origin = CGPointMake(0, posY);
        self.nadView.frame = newFrame;
        
        [targetView addSubview:self.nadView];
        [self.nadView resume];
    }
}



#pragma mark -------------------------------------------------------------------
#pragma mark Public

- (void)showAdBannerForRootViewCtr:(UIViewController *)viewCtr
                              posY:(CGFloat)posY {

    // 初回表示
    // iAd表示中かつビューが入れ替わった時
    // nend表示中かつビューが入れ替わったとき
    if (![viewCtr isEqual:self.currentRootViewCtr]) {
        
        self.currentRootViewCtr = viewCtr;
        
        // NEND
        if (iAdFailed) {
            
            [self showNADBannerAtView:viewCtr.view posY:posY];
        }
        // iAd
        else {
            
            [self removeAdBannerFromSuperview];

            CGRect newFrame = self.iAdView.frame;
            newFrame.origin = CGPointMake(0, posY);
            self.iAdView.frame = newFrame;
            
            [viewCtr.view addSubview:self.iAdView];
        }
    }
    // iAd失敗、nendに切り替える
    else if (iAdFailed) {

        [self showNADBannerAtView:viewCtr.view posY:posY];
    }
}

- (void)removeAdBannerFromSuperview {
    
    if (self.iAdView.superview) {
        [self.iAdView removeFromSuperview];
    }
    if (self.nadView.superview) {
        [self.nadView removeFromSuperview];
    }
}


#pragma mark -------------------------------------------------------------------
#pragma mark ADBannerViewDelegate

- (void)bannerViewWillLoadAd:(ADBannerView *)banner {
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
    iAdFailed = YES;
    
    // NENDを表示
    [self showAdBannerForRootViewCtr:self.currentRootViewCtr posY:self.iAdView.frame.origin.y];
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
}



#pragma mark -------------------------------------------------------------------
#pragma mark NADViewDelegate

- (void)nadViewDidFinishLoad:(NADView *)adView {
}

@end
