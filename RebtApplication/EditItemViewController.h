//
//  EditItemViewController.h
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/17.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditItemViewController : UITableViewController<UIActionSheetDelegate>

@property (strong, nonatomic) id editItem;

@property (retain, nonatomic) IBOutlet UITextView *aCellTextView;
@property (retain, nonatomic) IBOutlet UITextView *bCellTextView;
@property (retain, nonatomic) IBOutlet UITextView *cCellTextView;
@property (retain, nonatomic) IBOutlet UITextView *dCellTextView;
@property (retain, nonatomic) IBOutlet UITextView *eCellTextView;

@end
