//
//  list.m
//  MemoryGame
//
//  Created by Hao Zhuang on 12-11-25.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "list.h"
#import "AppDelegate.h"
@interface list ()

@end

@implementation list

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
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.SELECTSTAT = 0;
    
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
    // Return the number of rows in the section.
    NSData *serializ = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSMutableArray*myArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:serializ];
    return [myArray2 count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSData *serializ = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    myArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:serializ];
    // Configure the cell...
        
   
    if([[myArray2 objectAtIndex:[indexPath row]] isEqualToString:[NSString stringWithFormat:@"%i", [indexPath row]]]){
        cell.textLabel.text=@"";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled = NO;
    }
    else{
        cell.textLabel.text=[myArray2 objectAtIndex:[indexPath row]];
        
       
  
        
    }
    
    
    
    
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
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.SELECTSTAT = [indexPath row];
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *next = [board instantiateViewControllerWithIdentifier:@"selectdiff"];
    [self presentModalViewController:next animated:YES];


    }

@end
