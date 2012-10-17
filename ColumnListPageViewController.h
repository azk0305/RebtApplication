//
//  ColumnListPageViewController.h
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/11.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AdBannerManager.h"

@interface ColumnListPageViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> {
    
}
@property (retain, nonatomic) IBOutlet UIPickerView *pickerView;

@end
