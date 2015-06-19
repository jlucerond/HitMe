//
//  HitMeGame.m
//  HitMe
//
//  Created by Joe Lucero on 6/14/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "HitMeGame.h"
#import "PlayingCard.h"
#import "Deck.h"

@interface HitMeGame ()

@property (nonatomic) NSArray *validRanks;
@property (nonatomic) NSArray *validSuits;
@property (nonatomic) NSDictionary *colorForSuit;
@property (nonatomic) Deck *deck;

@end

@implementation HitMeGame

- (NSArray *) validRanks {
    if (! _validRanks) {
        _validRanks = @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    }
    return _validRanks;
}

- (NSArray *) validSuits {
    if (! _validSuits) {
        _validSuits = @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
    }
    return _validSuits;
}

- (NSDictionary *) colorForSuit {
    if (! _colorForSuit) {
        _colorForSuit = @{@"♠︎" : [UIColor blackColor], @"♣︎": [UIColor blackColor], @"♥︎" : [UIColor redColor], @"♦︎" : [UIColor redColor]};
    }
    return _colorForSuit;
}

// check these lines
- (BOOL) hasNextCard {
    return ([self.deck showNextCard] != nil);
}
- (PlayingCard *) nextCard {
//    if ([self hasNextCard]){
        return [self.deck dealNextCard];
 //
}

- (void) fillAndShuffle {
    self.deck = [[Deck alloc] init];
    //add 52 cards here
    [self fillDeck];
    
    //then shuffle
    [self shuffleDeck];
}

- (void) fillDeck {
    for (NSString *rank in self.validRanks){
        for (NSString *suit in self.validSuits){
            PlayingCard *newCard = [[PlayingCard alloc] initWithRank:rank
                                                                suit:suit
                                                               color:self.colorForSuit[suit]];
            [self.deck addCard:newCard];
        }
    }
}

- (void) shuffleDeck {
    [self.deck shuffleDeck];
    NSLog(@"%@", self.deck);
}

@end
