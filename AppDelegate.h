//
//  AppDelegate.h
//  MemoryGame
//
//  Created by Hao Zhuang on 11/4/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
   // NSInteger number;
    NSString * abc;
    
    NSInteger try;
    
    NSInteger fscore;
    
    NSInteger ID;
    
    NSInteger SELECTSTAT;
    
    NSInteger SELECTSTATGame;
 //   NSMutableArray *myArray7;
    
 //    NSMutableArray *myArray7;
    
//    NSInteger array[3][30][30]; //user in one game last historial record
    
//    NSInteger array1[3][30][30];
    
 //   NSString *UserName[30];
//    NSString *PassWord[30];
    
    
   
    
    
    
    
}

@property (strong, nonatomic) UIWindow *window;
@property (assign) NSString *abc;
@property (assign) NSInteger try;
@property (assign) NSInteger fscore;
@property (assign) NSInteger ID;
@property (assign) NSInteger SELECTSTAT;
@property (assign) NSInteger SELECTSTATGame;
@end
