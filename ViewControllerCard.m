//
//  ViewControllerCard.m
//  iConcentrate
//
//  Created by Patrick Wong on 2012-11-11.
//  Copyright (c) 2012 Team Asia. All rights reserved.
// Changelog:
// Version 0.1
// First Implementation
//Version 0.2
/*
 Added Shuffling based on misses
 Added Hiding of completed cards after shuffle
 Fixed issue with timer not resetting properly for shuffle
 Fixed issue with not changing playable property of AnimalCard objects properly
 Added arrayId property to AnimalCard class to easily identify position of AnimalCard object in the animalArray list
 */
// Version 0.3
/*
 Added medium and hard buttons
 Added pictures for the easy interfacec
 Fixed bug with associating miss counting and shuffling
 Implemented reveal and hide card function
 Increased time of reveal per card, since it was a bit too hard
 Implemented score
 Implemented difficulty adjustment (SelectionController)
 */
// Version 1.0 Release
/*
 Added sounds
 Added more pictures
Finished medium and hard interface (main storyboard)
 NSLogs removed to improve performance
 Changed difficulty modifier of score to more accurate reflect difficulty
 Fixed bug with shuffleCount not reseting between games which was negatively impacting score
 Added gold star for scoring well on highest difficulty (selectionController.m)
 */
/*
 To Do:
System integration and QA of the other games
 
 Bugs:
None discovered at the moment
 */


#import "ViewControllerCard.h"
#import "AnimalCard.h"
#import "AppDelegate.h"
#import "SelectionViewController.h"

static int cardRemaining;
static int misses;
static int clickCounter; // counts the number of clicks done in the session
static int timerCounter; // counts the number of repeats of the timer
static int difficulty; // difficulty of the current session
static int shuffleCount; // Count the number of shuffles
static double score; // score

@implementation ViewControllerCard

@synthesize missCount;
@synthesize sortedPosition;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    animalArray = [NSMutableArray arrayWithCapacity:30];
    
    //Retrieving animal names from plist file
    NSString *file = [[NSBundle mainBundle] pathForResource:@"AnimalNamesList" ofType:@"plist"];
    NSArray *names = [NSArray arrayWithContentsOfFile:file];
    
    
    
    for (NSString *element in names)
    {
        AnimalCard *animal = [[AnimalCard alloc] init];
        animal.name = element;
        [animalArray addObject:animal]; // Creating mutable array of animal objects
    }
    
    // Setting up sounds
    NSURL *soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"wrongSound" ofType:@"mp3"]];
    wrongGuess = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:NULL];
    
    soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"correctSound" ofType:@"mp3"]];
    correctGuess = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:NULL];
    
    soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"shuffleSound" ofType:@"mp3"]];
    shuffle = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:NULL];
    
    soundUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"winSound" ofType:@"mp3"]];
    win = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:NULL];
    
    [wrongGuess setVolume: 1.0];
    [wrongGuess prepareToPlay];
    [correctGuess setVolume: 1.0];
    [correctGuess prepareToPlay];
    [shuffle setVolume: 1.0];
    [shuffle prepareToPlay];
    [win setVolume: 1.0];
    [win prepareToPlay];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)cardCounter
{
    int num; // Number of cards
    
    if (difficulty == 1) // Easy
    {
        num = 12;
    }
    else if (difficulty == 2) // Medium
    {
        num = 16;
    }
    else if (difficulty == 3) // Hard
    {
        num = 20;
    }
    
    return num;
}

-(void)setGame // function for setting up the game
{
    int cardNum = [self cardCounter];
    int animalNum = cardNum/2; // one animal per pair of card
    cardRemaining = cardNum; 
    misses = 0;
    shuffleCount = 0;
    
    for (NSInteger i = 0; i < animalNum; i++) // Initializing the animals to playable for number of cards in play
    {
        AnimalCard *animal = [animalArray objectAtIndex:i];
        animal.playable = TRUE;
        animal.arrayId = i;
    }
    
    [self shuffle];
    
}

-(void)stopAllSounds // function for stopping sounds to prevent overlap
{
    [correctGuess stop];
    [wrongGuess stop];
}

-(void)shuffle // Shuffling function for Matching game
{
    int randomIndex;
       
    [shuffle play]; // play shuffle sound
    
    // array for holding all remaining "card positions"
    NSMutableArray *positionList = [NSMutableArray arrayWithCapacity:cardRemaining];

    for (NSInteger i = 0; i < cardRemaining; i++)
    {
        [positionList addObject:[NSNumber numberWithInteger:i]];
    }
        
   for (AnimalCard *animal in animalArray) // Assigning positions to the remaining animal cards
   {
       if (animal.playable == TRUE)
       {
           randomIndex = (arc4random() % [positionList count]); // first position
           animal.posFirst = [[positionList objectAtIndex:randomIndex] integerValue];
           [positionList removeObjectAtIndex:randomIndex]; // removing the occupied position from the list
           randomIndex = (arc4random() % [positionList count]); // second position
           animal.posSecond = [[positionList objectAtIndex:randomIndex] integerValue];
           [positionList removeObjectAtIndex:randomIndex]; // removing the second occupied position from the list
       }
       

   }
    
    sortedPosition = [NSMutableArray arrayWithCapacity:cardRemaining];
    
    for (NSInteger i = 0; i < cardRemaining; i++)
    {
        [sortedPosition addObject:[NSNull null]]; //Adding filler objects to fill the array to allow position inserts
    }
    
    for (AnimalCard *animal in animalArray) // Sort the animal into their positions
    {
        if (animal.playable == TRUE)
        {
            [sortedPosition insertObject:animal atIndex:animal.posFirst];
            [sortedPosition removeObjectAtIndex:animal.posFirst+1]; // Removing the first displaced filler object
            [sortedPosition insertObject:animal atIndex:animal.posSecond];
            [sortedPosition removeObjectAtIndex:animal.posSecond+1]; // Removing second displaced filler object
        }
        
    }

 
    // Reveals the cards for a set amount of time
    [self revealCards];
}


-(void)timerControl
{
    int timeElasped, currentTime, totalTime;
    int timerModifier; // modifier for how many seconds per card depending on difficulty
    
    if (difficulty == 1) // easy
    {
        timerModifier = 150; // 1500 ms per card
    }
    else if (difficulty == 2) // medium
    {
        timerModifier = 125; // 1250 ms per card
    }
    else // hard
    {
        timerModifier = 100; // 1000 ms per card
    }
    
    totalTime = cardRemaining * timerModifier; // Total time given for cardReveal
    timeElasped = timerCounter * 10; // 10 ms per counter
    currentTime = totalTime - timeElasped;
    
    if (currentTime == 0)
    {
        [timer invalidate];
        timer = nil;
        timerCounter = 0; // Reset the timeCounter
        [self hideCards];
    }
    
    timerCounter += 1; // increment the timer counter


}

-(void)revealCards
{
    int cardNum = [self cardCounter];
    
    for (int i=1; i < cardRemaining+1; ++i) [(UIButton *)[self.view viewWithTag:i] setHidden:NO]; // Temporary
    for (int i=1; i < cardNum+1; ++i) [(UIButton *)[self.view viewWithTag:i] setEnabled:NO]; // Disable all the buttons while the cards are revealed

    // Reveal the cards
    for (int i=0; i < cardRemaining; ++i)
    {
        AnimalCard *animal = [sortedPosition objectAtIndex:i];
        [(UIButton *)[self.view viewWithTag:i+1] setImage: [UIImage imageNamed:animal.name] forState:UIControlStateDisabled]; // Reveal all the pictures
    }

    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerControl) userInfo:nil repeats:YES];
   
}

-(void)hideCards 
{
    // Hide the cards
    for (int i = 0; i < cardRemaining; ++i)
    {
        [(UIButton *)[self.view viewWithTag:i+1] setImage: NULL forState:UIControlStateDisabled]; // Hide all the pictures
    }
    [shuffle stop]; // stop shuffle sound after it stops

    
    //Re-enable the remaining buttons after the cards are hidden
    for (int i=1; i < cardRemaining+1; ++i) [(UIButton *)[self.view viewWithTag:i] setEnabled:YES];
    for (int i=1; i < cardRemaining+1; ++i) [(UIButton *)[self.view viewWithTag:i] setTitle:@"?" forState:UIControlStateNormal];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) // if the user presses the exit button on the alert box
    {
        [self performSegueWithIdentifier:@"returnToSelection" sender:self];
    }
}

-(void)scoreCount // Calculates score
{
    double difficultyModifier; // Modifies the score based on difficulty of the session
    int totalCards = [self cardCounter];
    double correctRate;
    if (difficulty == 1) // easy
    {
        difficultyModifier = 0.5;
    }
    else if (difficulty == 2) // medium
    {
        difficultyModifier = 1.0;
    }
    else // hard
    {	
        difficultyModifier = 1.5;
    }
    
    score = ((100 / (1+((double)misses/totalCards))) * difficultyModifier) * (1-(0.05*shuffleCount)); // 5 % deduction of score based on each shuffle
    double maxScore = (100 / (1+(0/totalCards)) * difficultyModifier); // maximum possible score for that difficulty
    if (score < 0) score = 0; // Prevent negative scores
    
    NSLog(@"Score : %f, Maxscore : %f, Misses : %i", score, maxScore, misses);
    
    correctRate = (score/maxScore);
    
    int correctPercent = correctRate*100;
    

    
    NSLog(@"CorrectRate:%i", correctPercent );
        
    // Saving score and performance data
    NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];
 //   [userData setDouble:score forKey:@"userScore"];
 //   [userData setDouble:correctPercent forKey:@"userRating"];
 //   [userData setInteger:difficulty forKey:@"userDifficulty"];
    
   
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];

    NSData  *a= [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi3"];
    NSMutableArray *myArray7 = [NSKeyedUnarchiver unarchiveObjectWithData:a];
    NSData *b= [[NSUserDefaults standardUserDefaults] objectForKey:@"score3"];
    NSMutableArray* myArray8 = [NSKeyedUnarchiver unarchiveObjectWithData:b];
    
    [myArray7 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", difficulty]];
    [myArray8 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", correctPercent]];
    
    

    for(int a =0; a<30; a++){
        NSLog( [myArray8 objectAtIndex:a]);
    }
    

    
    NSData *s = [NSKeyedArchiver archivedDataWithRootObject:myArray7];
    
    [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"diffi3"];
    
 
    
    NSData *ss = [NSKeyedArchiver archivedDataWithRootObject:myArray8];
    
    [[NSUserDefaults standardUserDefaults] setObject:ss forKey:@"score3"];
    
    
    NSData *diff3 = [NSKeyedArchiver archivedDataWithRootObject:myArray8];
       
    
    
  
    [[NSUserDefaults standardUserDefaults] setObject:diff3 forKey:@"score3"];
    
    
    
    
    
    
    
        
}


    
-(IBAction)guessButtons:(id)sender
{
    int cardNum = [self cardCounter];
    UIButton *guessed = (UIButton *)sender;
    if (clickCounter % 2 == 0) // If the click is going to be an odd number click
    {
        guessed.enabled = NO;
        firstGuess = [sortedPosition objectAtIndex:[sender tag]-1];
        firstGuess.guessedPos = [sender tag];
        [guessed setImage: [UIImage imageNamed:firstGuess.name] forState:UIControlStateDisabled];

    }
    else // even
    {
        secondGuess = [sortedPosition objectAtIndex:[sender tag]-1];

        if (secondGuess.name == firstGuess.name) // If the guess is correct
        {
            guessed.enabled = NO;
            [guessed setImage:[UIImage imageNamed:secondGuess.name] forState:UIControlStateDisabled]; // Showing picture for second guess
            
            [correctGuess prepareToPlay];
            [correctGuess play]; // play sound for correct guess
            
            cardRemaining -= 2; // Deduct the two guesses cards from card remaining pool
            
            // Remove the animal from the game
            AnimalCard *guessedAnimal = [animalArray objectAtIndex:firstGuess.arrayId];
            guessedAnimal.playable = FALSE;	
        }
        else
        {
            misses += 1;
            [(UIButton *)[self.view viewWithTag:firstGuess.guessedPos]setEnabled:YES]; //reenable the first button
            [(UIButton *)[self.view viewWithTag:firstGuess.guessedPos]setTitle:@"?" forState:UIControlStateNormal]; // Change text for first button
            [(UIButton *)[self.view viewWithTag:firstGuess.guessedPos]setImage:[UIImage imageNamed:NULL] forState:UIControlStateNormal]; // hide the first image
            
            // Play incorrect sound
            [wrongGuess prepareToPlay];
            [wrongGuess play];
            
            if (misses % 5 == 0) // If it is the 5th miss
            {
                for (int i=1; i < cardNum+1; ++i) [(UIButton *)[self.view viewWithTag:i] setEnabled:NO]; // Disable all the buttons
                for (int i=1; i < cardNum+1; ++i) [(UIButton *)[self.view viewWithTag:i] setHidden:YES]; // Hide all the buttons
                shuffleCount ++;
                
                [self shuffle];
            }
        }
        
    }
    
    clickCounter += 1;
    missCount.text = [NSString stringWithFormat:@"%i", misses];
    
    if (cardRemaining == 0) // If the game ended
    {
        [self stopAllSounds];
        [win play]; // play winning sound

        [self scoreCount];
        NSString *endMessage = [NSString stringWithFormat:@"You have cleared this game session with a score of %f", score];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:endMessage delegate:self cancelButtonTitle:@"Return to Game Selection" otherButtonTitles:nil, nil];
        [alert show];

    }
 	
}

-(IBAction)startButtonEasy:(id)sender
{
    difficulty = 1;
    UIButton *starter = (UIButton *)sender;
    starter.enabled = NO; // Disable the start button
    starter.hidden = YES; // Hide the start button
    [self setGame];
    
}

-(IBAction)startButtonMedium:(id)sender
{
    difficulty = 2;
    UIButton *starter = (UIButton *)sender;
    starter.enabled = NO; 
    starter.hidden = YES; 
    [self setGame]; 
    
}

-(IBAction)startButtonHard:(id)sender
{
    difficulty = 3;
    UIButton *starter = (UIButton *)sender;
    starter.enabled = NO;
    starter.hidden = YES;
    [self setGame];    
}


@end
