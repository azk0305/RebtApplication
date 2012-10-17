//
//  EditItemViewController.m
//  RebtApplication
//
//  Created by 浅見 憲司 on 2012/10/17.
//  Copyright (c) 2012年 Material-Tokorozawa. All rights reserved.
//

#import "EditItemViewController.h"

#import "RebtApplicationAppDelegate.h"

@interface EditItemViewController ()

@end

@implementation EditItemViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
    if(self.editItem) {
        self.aCellTextView.text = [[self.editItem valueForKey:@"aCell"] description];
        self.bCellTextView.text = [[self.editItem valueForKey:@"bCell"] description];
        self.cCellTextView.text = [[self.editItem valueForKey:@"cCell"] description];
        self.dCellTextView.text = [[self.editItem valueForKey:@"dCell"] description];
        self.eCellTextView.text = [[self.editItem valueForKey:@"eCell"] description];
    }
}

- (IBAction)saveClicked:(id)sender {
    UIActionSheet *saveActionSheet = [[UIActionSheet alloc] initWithTitle:@"保存しますか？" delegate:self cancelButtonTitle:@"キャンセル" destructiveButtonTitle:@"OK" otherButtonTitles:nil];
    
    [saveActionSheet showInView:self.view];
    [saveActionSheet release];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self updateObject];
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
            
        case 1:
        default:
            break;
    }
}

- (void)updateObject {
    
    // NSManagedObjectModel, NSPersistentStoreCoodinator, NSManagedObjectContext
    RebtApplicationAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    // NSManagedObject for update
    NSManagedObject *updateObject = self.editItem;
    
    // aCell,bCell,cCell,dCell,eCell
    [updateObject setValue:self.aCellTextView.text forKey:@"aCell"];
    [updateObject setValue:self.bCellTextView.text forKey:@"bCell"];
    [updateObject setValue:self.cCellTextView.text forKey:@"cCell"];
    [updateObject setValue:self.dCellTextView.text forKey:@"dCell"];
    [updateObject setValue:self.eCellTextView.text forKey:@"eCell"];
    
    //updateDate
    NSDate *nowDate = [NSDate date];
    [updateObject setValue:nowDate forKey:@"updateDate"];
    
    // Save the context.
    NSError *error = nil;
    if (![appDelegate.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)setEditItem:(id)editItem
{
    if (_editItem != editItem) {
        [_editItem release];
        _editItem = [editItem retain];
        
        // Update the view.
        [self configureView];
    }
} 

- (void)dealloc {
    [_editItem release];
    [_aCellTextView release];
    [_bCellTextView release];
    [_cCellTextView release];
    [_dCellTextView release];
    [_eCellTextView release];
    [super dealloc];
}
@end
