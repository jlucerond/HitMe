//
//  PlayingCardTests.m
//  HitMe
//
//  Created by Joe Lucero on 6/14/15.
//  Copyright (c) 2015 Joe Lucero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PlayingCard.h"

@interface PlayingCardTests : XCTestCase

@property (nonatomic) PlayingCard *playingCard;

@end

@implementation PlayingCardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.playingCard = [[PlayingCard alloc] initWithRank:@"A" suit:@"♥︎" color:[UIColor redColor]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.playingCard = nil;
}

- (void) testPlayingCardExists {
    XCTAssertNotNil(self.playingCard, @"the playing card should exist");
}

- (void) testWhetherCardIsRedAceOfHearts {
    XCTAssertEqualObjects(self.playingCard.cardRank, @"A", @"is not an ace");
    XCTAssertEqualObjects(self.playingCard.cardSuit, @"♥︎", @"is not a heart");
    XCTAssertEqualObjects(self.playingCard.cardColor, [UIColor redColor], @"is not a red color");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
