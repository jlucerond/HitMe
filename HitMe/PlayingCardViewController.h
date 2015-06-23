//
//  PlayingCardViewController.h
//  HitMe
//
//  Created by Joe Lucero on 6/19/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import "GameViewController.h"

@class PlayingCard;

@interface PlayingCardViewController : GameViewController

@property (nonatomic, readonly) PlayingCard *playingCard;
@property (nonatomic) BOOL isFaceUp;

- (void) displayCard: (PlayingCard *) playingCard;

@end
