//
//  SelectionViewController.m
//  iConcentrate
//
//  Created by Patrick Wong on 2012-11-22.
//  Copyright (c) 2012 Team Asia. All rights reserved.
//

#import "SelectionViewController.h"
#import "AppDelegate.h"
@interface SelectionViewController ()

@end


@implementation SelectionViewController


@synthesize cardStar;


-(IBAction)cardMatchingGame:(id)sender
{
 //   NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];
 //   double rating = [userData doubleForKey:@"userRating"];
 //   int difficulty = [userData integerForKey:@"userDifficulty"];

    
   
    
    
        
   

    
    
    

    if (rating >= 80) // if the user scored 80% or above of the max score
    {
        performance = @"good";
    }
    else if (rating < 40) // if the user scored below 40%
    {
        performance = @"bad";
    }
    else // scored 40% or above and below 80%
    {
        performance = @"medium";
    }
    
    if (difficulty == 0) // If there is no prior difficulty data
    {
        difficulty = 1; // default is easy
    }
    
    if ([performance isEqualToString:@"good"] && difficulty < 3) // Increase difficulty if user did well
    {
        difficulty += 1;
    }
    else if ([performance isEqualToString:@"bad"] && difficulty > 1) // Decrease difficulty if user did not so well
    {
        difficulty -= 1;
    }
    
 //   NSLog(@"Current difficulty is %i", difficulty);
    
    if (difficulty == 1)
    {
        [self performSegueWithIdentifier:@"cardDifficultyEasy" sender:self];
    }
    else if (difficulty == 2)
    {
        [self performSegueWithIdentifier:@"cardDifficultyMedium" sender:self];
    }
    else if (difficulty == 3)
    {
        [self performSegueWithIdentifier:@"cardDifficultyHard" sender:self];
    }
    else
    {
        NSLog(@"Error");
    }
    
    
    
    
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
 //   NSLog(@"DD%d",apd.ID);

	// Do any additional setup after loading the view.
    NSData  *diff3= [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi3"];
    myArray7 = [NSKeyedUnarchiver unarchiveObjectWithData:diff3];
    
    NSData  *score3= [[NSUserDefaults standardUserDefaults] objectForKey:@"score3"];
    myArray8 = [NSKeyedUnarchiver unarchiveObjectWithData:score3];
    
    difficulty = [[myArray7 objectAtIndex:apd.ID]integerValue];
    
    rating = [[myArray8 objectAtIndex:apd.ID]integerValue];
    
    NSLog(@"difficult is %d", difficulty);
    NSLog(@"Rating is %f", rating);
    
    [myArray7 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", difficulty]];
    
    NSData *s = [NSKeyedArchiver archivedDataWithRootObject:myArray7];
    
    [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"diff3"];
    
   
    
    
    if (difficulty == 3 && [performance isEqualToString:@"good"]) // if the user scored well on the highest difficulty
    {
        cardStar.hidden = NO; // show the gold star
    }
    else
    {
        cardStar.hidden = YES; // Hide the gold star
    }
   
   

    


    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
