//
//  ItemListViewController.h
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/17.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemListViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
