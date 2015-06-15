//
//  ViewControllerparentorchild.h
//  MemoryGame
//
//  Created by Hao Zhuang on 11/22/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerparentorchild : UIViewController
{
    
    
    
    
      
 
        NSMutableArray * PassWord;
        NSMutableArray * UserName;
        NSMutableArray * Exist;
    
    NSMutableArray *difficulty1;
    NSMutableArray *difficulty2;
    NSMutableArray *difficulty3;
    NSMutableArray *Score1;
    NSMutableArray *Score2;
    NSMutableArray *Score3;
    
    NSMutableArray *SSScore3;

    NSInteger times;
    bool add;
        
}

@end
