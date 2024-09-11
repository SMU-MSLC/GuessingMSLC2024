//
//  GuessModel.m
//  GuessingMSLC2024
//
//  Created by Eric Cooper Larson on 9/4/24.
//

#import "GuessModel.h"

@interface  GuessModel ()

@property (strong,nonatomic) NSNumber* correctNum;

@end

@implementation GuessModel


-(NSNumber*)correctNum{
    
    if(!_correctNum){
        _correctNum = @(arc4random_uniform(100)+1);
    }
    
    return _correctNum;
}

-(GuessValue)makeGuess:(NSInteger)guess{
    
    NSInteger tmpCorrect = [self.correctNum integerValue];
    if (guess == tmpCorrect){
        return GuessIsCorrect;
    }else if(guess < tmpCorrect){
        return GuessIsLow;
    }else if(guess >  tmpCorrect){
        return GuessIsHigh;
    }
    // should never get here, consider throwing an error
    return false;
}



@end
