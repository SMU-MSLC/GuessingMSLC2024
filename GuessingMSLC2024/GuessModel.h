//
//  GuessModel.h
//  GuessingMSLC2024
//
//  Created by Eric Cooper Larson on 9/4/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    GuessIsCorrect,
    GuessIsHigh,
    GuessIsLow,
} GuessValue;

@interface GuessModel : NSObject

-(GuessValue)makeGuess:(NSInteger)guess;

@end

NS_ASSUME_NONNULL_END
