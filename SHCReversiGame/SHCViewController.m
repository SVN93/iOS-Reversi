//
//  SHCViewController.m
//  SHCReversiGame
//
//  Created by Colin Eberhardt on 07/12/2012.
//  Copyright (c) 2012 Colin Eberhardt. All rights reserved.
//

#import "SHCViewController.h"
#import "SHCReversiBoard.h"
#import "SHCReversiBoardView.h"
#import "SHCComputerOpponent.h"

@interface SHCViewController () <UIAlertViewDelegate>

@end

@implementation SHCViewController
{
    SHCReversiBoard* _board;
    SHCComputerOpponent* _computer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set the various background images
    self.backgroundImage.image = [UIImage imageNamed: @"Reversi.png"];
//    self.gameOverImage.image = [UIImage imageNamed: @"GameOver.png"];
//    self.gameOverImage.hidden = YES;
    
    // create our game board
    _board = [[SHCReversiBoard alloc] init];
    [_board setToInitialState];
    
    // create a view
    SHCReversiBoardView* reversiBoard = [[SHCReversiBoardView alloc] initWithFrame:CGRectMake(88,151,600,585) andBoard:_board];
    [self.view addSubview:reversiBoard];
    
    [self gameStateChanged];
    [_board.reversiBoardDelegate addDelegate:self];
    
    _computer = [[SHCComputerOpponent alloc] initWithBoard:_board
                                                     color:BoardCellStateWhitePiece
                                                  maxDepth:5];
}

- (void)showGameOverMessage
{
    NSString *message;
    if (_board.whiteScore > _board.blackScore) {
        message = @"Белые выиграли!";
    } else {
        message = @"Черные выиграли!";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Игра окончена"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"Переиграть"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self restartGame];
    }
}

- (void)restartGame
{
    if (_board.gameHasFinished)
    {
        [_board setToInitialState];
        [self gameStateChanged];
    }
}

- (void)gameStateChanged
{
    if (_board.gameHasFinished) {
        [self showGameOverMessage];
    }
    
    _whiteScore.text = [NSString stringWithFormat:@"%ld", (long)_board.whiteScore];
    _blackScore.text = [NSString stringWithFormat:@"%ld", (long)_board.blackScore];
//    _gameOverImage.hidden = !_board.gameHasFinished;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
