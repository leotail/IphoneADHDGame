//
//  scorelist.m
//  MemoryGame
//
//  Created by Hao Zhuang on 12-11-25.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "scorelist.h"
#import "AppDelegate.h"
@interface scorelist ()

@end

@implementation scorelist

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    
       
    
    
    
    
   
    if(apd.SELECTSTATGame == 1){
        NSData * SSstat1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"SSscore3"];
        
        
        
        NSMutableArray *mystat1 = [NSKeyedUnarchiver unarchiveObjectWithData:SSstat1];
        
    
    
   
    
  
    
        return [mystat1 count];}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"scorecell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    float zero=-1.0;
    
    NSData * SSstat1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"SSscore3"];
    
    
    
    NSMutableArray *mystat1 = [NSKeyedUnarchiver unarchiveObjectWithData:SSstat1];
    
   AppDelegate *apd=[[UIApplication sharedApplication] delegate];
   
    
    if([[mystat1 objectAtIndex:[indexPath row]] isEqualToString:[NSString stringWithFormat:@"%f",zero]]){
        cell.textLabel.text=@"";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
    else{
        cell.textLabel.text=[mystat1 objectAtIndex:[indexPath row]];}
        return cell;
}

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
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *next = [board instantiateViewControllerWithIdentifier:@"selectdiff"];
    [self presentModalViewController:next animated:YES];
}

@end
