//
//  ViewController.m
//  HitMe
//
//  Created by Joe Lucero on 6/14/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import "ViewController.h"
#import "HitMeGame.h"
#import "PlayingCard.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *playingCardLabel;
@property (nonatomic) HitMeGame *game;
@property (nonatomic) BOOL isFaceDown;
@property (nonatomic) PlayingCard *currentPlayingCard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playingCardLabel.layer.cornerRadius = self.playingCardLabel.frame.size.width/12;
    self.playingCardLabel.layer.masksToBounds = true;
    self.game = [[HitMeGame alloc] init];
    [self.game fillAndShuffle];
    [self getNextCard];
}

- (void) redrawCard {
    self.playingCardLabel.text = [NSString stringWithFormat:@"%@ %@", self.currentPlayingCard.cardRank, self.currentPlayingCard.cardSuit];
    if (self.isFaceDown) {
        self.playingCardLabel.textColor = [UIColor whiteColor];
    }
    else {
        self.playingCardLabel.textColor = self.currentPlayingCard.cardColor;
    }
}

- (IBAction)flipCardButtonTapped:(UIButton *)sender {
    self.isFaceDown = !self.isFaceDown;
    [self redrawCard];
}

- (void) getNextCard {
    self.currentPlayingCard = [self.game nextCard];
    [self redrawCard];
}

- (IBAction)nextCardButtonTapped:(UIButton *)nextCardButton {
    [self getNextCard];
    nextCardButton.enabled = [self.game hasNextCard];
}

@end
