//
//  PlayingCardViewController.m
//  HitMe
//
//  Created by Joe Lucero on 6/19/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCard.h"

@interface PlayingCardViewController ()

@property (strong, nonatomic) IBOutlet UILabel *playingCardLabel;
@property (strong, nonatomic) IBOutlet UIImageView *playingCardBackImageView;
@property (nonatomic, readwrite) PlayingCard *playingCard;

@end

@implementation PlayingCardViewController

- (void)viewDidLoad {
    //[super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.layer.cornerRadius = self.view.frame.size.width/32;
}

- (IBAction)viewTappedToFlipCard:(UITapGestureRecognizer *)sender {
    [UIView animateWithDuration:.25 animations:^{
        self.view.transform = CGAffineTransformMakeScale(0.01, 1);
        //self.view.center = CGPointMake(self.view.center.x + self.view.frame.size.width/2, self.view.center.y);
    } completion:^(BOOL finished) {
        self.playingCardBackImageView.hidden = !self.playingCardBackImageView.hidden;
        [UIView animateWithDuration:.25 animations:^{
            self.view.transform = CGAffineTransformIdentity;
        }];
    }];
}

- (void) displayCard:(PlayingCard *)playingCard {
    self.playingCard = playingCard;
    self.playingCardLabel.textColor = self.playingCard.cardColor;
    self.playingCardLabel.text = [NSString stringWithFormat:@"%@ %@", self.playingCard.cardRank, self.playingCard.cardSuit];
}

#pragma mark- isFaceUp property getter/setter

- (BOOL) isFaceUp {
    return self.playingCardBackImageView.hidden;
}

- (void) setIsFaceUp:(BOOL)isFaceUp {
    self.playingCardBackImageView.hidden = isFaceUp;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
