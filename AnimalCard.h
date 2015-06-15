//
//  AnimalCard.h
//  iConcentrate
//
//  Created by Patrick Wong on 2012-11-12.
//  Copyright (c) 2012 Team Asia. All rights reserved.
//  

#import <Foundation/Foundation.h>

@interface AnimalCard : NSObject
{
    NSString *name;
    NSInteger posFirst;
    NSInteger posSecond;
    Boolean playable;
    NSInteger guessedPos;
    NSInteger arrayId; // Identifies position in array

}

@property(strong, nonatomic)NSString *name;
@property NSInteger posFirst;
@property NSInteger posSecond;
@property Boolean playable;
@property NSInteger guessedPos;
@property NSInteger arrayId;


@end
