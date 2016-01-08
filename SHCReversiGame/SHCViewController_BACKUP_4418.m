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
<<<<<<< HEAD
    self.endInfoLabel.hidden = YES;
=======
//    self.gameOverImage.image = [UIImage imageNamed: @"GameOver.png"];
//    self.gameOverImage.hidden = YES;
>>>>>>> e95bf7ba879790900d00acc09226886eabd88544
    
    // create our game board
    _board = [[SHCReversiBoard alloc] init];
    [_board setToInitialState];
    
    // create a view
    SHCReversiBoardView* reversiBoard = [[SHCReversiBoardView alloc] initWithFrame:CGRectMake(88,151,600,585) andBoard:_board];
    [self.view addSubview:reversiBoard];
    
    [self gameStateChanged];
    [_board.reversiBoardDelegate addDelegate:self];
    
<<<<<<< HEAD
    // add a tap recognizer
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(restartGame:)];
    [self.view addGestureRecognizer:tapRecognizer];
    
=======
>>>>>>> e95bf7ba879790900d00acc09226886eabd88544
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
<<<<<<< HEAD
    if (_board.whiteScore > _board.blackScore) {
        self.endInfoLabel.text = @"Белые выиграли!\rНажмите чтобы играть";
    } else {
        self.endInfoLabel.text = @"Черные выиграли!\rНажмите чтобы играть";
    }
    
    self.endInfoLabel.hidden = !_board.gameHasFinished;
    _whiteScore.text = [NSString stringWithFormat:@"%ld", (long)_board.whiteScore];
    _blackScore.text = [NSString stringWithFormat:@"%ld", (long)_board.blackScore];
=======
    if (_board.gameHasFinished) {
        [self showGameOverMessage];
    }
    
    _whiteScore.text = [NSString stringWithFormat:@"%ld", (long)_board.whiteScore];
    _blackScore.text = [NSString stringWithFormat:@"%ld", (long)_board.blackScore];
//    _gameOverImage.hidden = !_board.gameHasFinished;
>>>>>>> e95bf7ba879790900d00acc09226886eabd88544
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
