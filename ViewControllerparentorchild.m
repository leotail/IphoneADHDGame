//
//  ViewControllerparentorchild.m
//  MemoryGame
//
//  Created by Hao Zhuang on 11/22/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "ViewControllerparentorchild.h"

@interface ViewControllerparentorchild ()

@end

@implementation ViewControllerparentorchild

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
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    
    
    NSInteger change =  [defaults integerForKey:@"changenot"];
    
 //   NSLog(@"Change is %d", change);
    
    
    
  //  NSLog([NSString stringWithFormat:@"%i", change]);
    
 
        Exist = [NSMutableArray arrayWithCapacity:30];
    
        for(int a = 0; a <30; a++){
      
            [Exist insertObject:@"false" atIndex:a];
        }
    
        [Exist replaceObjectAtIndex:0 withObject:@"true"];
    
        NSData *ser = [NSKeyedArchiver archivedDataWithRootObject:Exist];
        [[NSUserDefaults standardUserDefaults] setObject:ser forKey:@"exist"];
  
  
    change = 0;
   
    if(change==0){  //give all the array the space and default value;
        PassWord= [NSMutableArray arrayWithCapacity:30];
        UserName = [NSMutableArray arrayWithCapacity:30];
        difficulty1 = [NSMutableArray arrayWithCapacity:30];

        difficulty2 = [NSMutableArray arrayWithCapacity:30];
        
        difficulty3 = [NSMutableArray arrayWithCapacity:30];
        
        Score1 = [NSMutableArray arrayWithCapacity:30];
        
        Score2 = [NSMutableArray arrayWithCapacity:30];
        
        Score3 = [NSMutableArray arrayWithCapacity:30];

       SSScore3 = [NSMutableArray arrayWithCapacity:30];
       
       
        for(int a = 0; a <30; a++){
            [PassWord insertObject:[NSString stringWithFormat:@"%i", a] atIndex:a];
            [UserName insertObject:[NSString stringWithFormat:@"%i", a] atIndex:a];
            
     

             [difficulty1 insertObject:[NSString stringWithFormat:@"%i", 2] atIndex:a];
            [difficulty2 insertObject:[NSString stringWithFormat:@"%i", 2] atIndex:a];
            [difficulty3 insertObject:[NSString stringWithFormat:@"%i", 0] atIndex:a];
            
            [Score1 insertObject:[NSString stringWithFormat:@"%i", 0] atIndex:a];
            [Score2 insertObject:[NSString stringWithFormat:@"%i", 0] atIndex:a];
            [Score3 insertObject:[NSString stringWithFormat:@"%i", 0] atIndex:a];
            [SSScore3 insertObject:[NSString stringWithFormat:@"%f", -1.0] atIndex:a];
        }
        [PassWord replaceObjectAtIndex:0 withObject:@"PassWord"];
        [UserName replaceObjectAtIndex:0 withObject:@"Username"];
        
        
        
        NSData *serializ = [NSKeyedArchiver archivedDataWithRootObject:UserName];
        NSData *serialized = [NSKeyedArchiver archivedDataWithRootObject:PassWord];
        NSData *diff1 = [NSKeyedArchiver archivedDataWithRootObject:difficulty1];
        NSData *diff2 = [NSKeyedArchiver archivedDataWithRootObject:difficulty2];
        NSData *diff3 = [NSKeyedArchiver archivedDataWithRootObject:difficulty3];
        NSData *score1 = [NSKeyedArchiver archivedDataWithRootObject:Score1];
        NSData *score2 = [NSKeyedArchiver archivedDataWithRootObject:Score2];
        NSData *score3 = [NSKeyedArchiver archivedDataWithRootObject:Score3];
        NSData *ssscore3 = [NSKeyedArchiver archivedDataWithRootObject:Score3];


        
        [[NSUserDefaults standardUserDefaults] setObject:serializ forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:serialized forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] setObject:diff1 forKey:@"diffi1"];
         [[NSUserDefaults standardUserDefaults] setObject:diff2 forKey:@"diffi2"];
        [[NSUserDefaults standardUserDefaults] setObject:diff3 forKey:@"diffi3"];
        [[NSUserDefaults standardUserDefaults] setObject:score1 forKey:@"score1"];
        [[NSUserDefaults standardUserDefaults] setObject:score2 forKey:@"score2"];
        [[NSUserDefaults standardUserDefaults] setObject:score3 forKey:@"score3"];
        [[NSUserDefaults standardUserDefaults] setObject:ssscore3 forKey:@"SSscore3"];
        
        NSMutableArray* SSDIFFARRAY = [NSMutableArray arrayWithCapacity:30];
        NSMutableArray* usermgdiff = [NSMutableArray arrayWithCapacity:30];
        NSMutableArray* SSPosition = [NSMutableArray arrayWithCapacity:30];
        
        NSMutableArray* MGDIFFARRAY = [NSMutableArray arrayWithCapacity:30];
        NSMutableArray* usermgdiff2 = [NSMutableArray arrayWithCapacity:30];
        NSMutableArray* MGPosition = [NSMutableArray arrayWithCapacity:30];
        
       
        
        for(int w = 0; w<30; w++){
            [usermgdiff insertObject:[NSString stringWithFormat:@"%f", -1.0] atIndex:w];
            [SSPosition insertObject:[NSString stringWithFormat:@"%i", 0] atIndex:w];
            
    //        NSLog(@"SSPOsition%@", [SSPosition objectAtIndex:w]);
            
   //         NSLog(@"Username%@", [UserName objectAtIndex:w]);
    //        NSLog(@"PassWord%@", [PassWord objectAtIndex:w]);

            
            
            [usermgdiff2 insertObject:[NSString stringWithFormat:@"%f",-1.0] atIndex:w];
            [MGPosition insertObject:[NSString stringWithFormat:@"%i", 0] atIndex:w];
        }
        
        for(int i=0;i<30;i++){
            
            [SSDIFFARRAY insertObject:usermgdiff atIndex:i];
             [MGDIFFARRAY insertObject:usermgdiff atIndex:i];
            
            
        }
        
        NSData *SSstat1 = [NSKeyedArchiver archivedDataWithRootObject:SSDIFFARRAY];
        
        NSData *SSSpostion = [NSKeyedArchiver archivedDataWithRootObject:SSPosition];
        
        NSData *MGstat1 = [NSKeyedArchiver archivedDataWithRootObject:MGDIFFARRAY];
        
        NSData *MGpostion = [NSKeyedArchiver archivedDataWithRootObject:MGPosition];
        
        [[NSUserDefaults standardUserDefaults] setObject:MGstat1 forKey:@"MGstat1"];
        
        [[NSUserDefaults standardUserDefaults] setObject:SSstat1 forKey:@"SSstat1"];

        [[NSUserDefaults standardUserDefaults] setObject:MGpostion forKey:@"MGPosition"];
        
        [[NSUserDefaults standardUserDefaults] setObject:SSSpostion forKey:@"SSpostion"];
        
        
        
      
    }
    if(change==1){
   //     NSLog(@"get old");
        
       
        
    }
   // Username = [NSArray arrayWithCapacity:30];
    
   
   
    

    
    

    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
