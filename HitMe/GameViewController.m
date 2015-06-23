//
//  GameViewController.m
//  HitMe
//
//  Created by Joe Lucero on 6/14/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import "GameViewController.h"
#import "HitMeGame.h"
#import "PlayingCardViewController.h"

@interface GameViewController ()
@property (nonatomic) HitMeGame *game;
@property (nonatomic) PlayingCardViewController *playingCardVC;
@property (nonatomic) PlayingCardViewController *nextPlayingCardVC;
@property (strong, nonatomic) IBOutlet UIView *playingCardView;
@property (strong, nonatomic) IBOutlet UIImageView *deckPlaceholderImageView;
@property (nonatomic) BOOL isDealingACard;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpGame];
    [self setUpGameBoard];
    
}

- (void)setUpGame {
    self.game = [[HitMeGame alloc] init];
    [self.game fillAndShuffle];
}

- (void) setUpGameBoard {
    self.playingCardVC = [[self childViewControllers] firstObject];
    self.deckPlaceholderImageView.layer.cornerRadius = self.view.frame.size.width/32;
    [UIView animateWithDuration:1
                     animations:^{
                         self.deckPlaceholderImageView.alpha = 0;
                         self.playingCardVC.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [self showNextCard];
                         //doesn't do anything yet
                     }];
}

- (void) showNextCard {
    if ([self.game hasNextCard]){
        [self createNextCard];
        [self.nextPlayingCardVC displayCard:[self.game nextCard]];
    }
}

- (void) createNextCard {
    self.nextPlayingCardVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PlayingCardScene"];
    self.nextPlayingCardVC.view.frame = self.deckPlaceholderImageView.frame;
    [self.view addSubview:self.nextPlayingCardVC.view];
    self.nextPlayingCardVC.view.alpha = 0;
    self.nextPlayingCardVC.isFaceUp = self.playingCardVC.isFaceUp;
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.nextPlayingCardVC.view.alpha = 1;
                     }];
}

- (IBAction)nextButtonTapped:(UIButton *)nextCardButton {
    [self showNextCard];
    nextCardButton.enabled = [self.game hasNextCard];
}

- (IBAction)viewDidGetSwipeUp:(UISwipeGestureRecognizer *)sender {
    if (!self.isDealingACard){
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.isDealingACard = true;
                         self.nextPlayingCardVC.view.frame = self.playingCardView.frame;
                         self.playingCardVC.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         self.playingCardVC = self.nextPlayingCardVC;
                         [self showNextCard];
                         self.isDealingACard = false;
                     }];
    }
}

@end
