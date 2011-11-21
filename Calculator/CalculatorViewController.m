//
//  MBLViewController.m
//  Calculator
//
//  Created by Vassilis Papakonstantinou on 11/7/11.
//  Copyright (c) 2011 Eugenides Foundation & Eugenides Group. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@implementation CalculatorViewController

-(CalculatorBrain *) brain{
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

-(IBAction)digitPressed:(UIButton *)sender{

    NSString *digit = [[sender titleLabel] text];
    
    if ([digit isEqual:@"π"]){
        digit = [NSString stringWithFormat:@"%f", M_PI];
    }
    
    NSRange rangeDisplay = [display.text rangeOfString:@"."];
    NSRange rangeDigit = [digit rangeOfString:@"."];
    decimalPointAlreadyPressed = rangeDisplay.location == NSNotFound?NO:YES;
    decimalPointPressed = rangeDigit.location == NSNotFound?NO:YES;    
    
    if (userIsInTheMiddleOfTypingANumber) {        
        if (decimalPointAlreadyPressed && decimalPointPressed){
            [errorMessageDisplay setText:@"2nd decimal"];;
            
        } else {
            [display setText:[[display text] stringByAppendingString:digit]];
        }


    } else {
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

-(void)operationPressed:(UIButton *)sender{

    //User is in the middle of typing a number when the systems receives
    //an "operationPressed" call. Then it sets the text of the display to
    //the value of the operand and then goes on to define the selected operation
    
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text] doubleValue]];
         userIsInTheMiddleOfTypingANumber = NO;
    }
    
    //The sender button titleLabel.text is set as the selected operation
    //by calling the brain performOperation method. If none of the "if-statements"
    //matches the "operation" set, the "else" calls the "waitingOperation" method.

    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
    
    
    if ([operation isEqual:@"C"]) {
        userIsInTheMiddleOfTypingANumber = NO;
        decimalPointAlreadyPressed = NO;
        [memoryOnDisplay setText:@""];
    }
    
    if ([operation isEqual:@"M"] || [operation isEqual:@"M+"]) {
        [memoryOnDisplay setText:@"M"];
    }

    if ([operation isEqual:@"CM"]) {
        [memoryOnDisplay setText:@""];
    }
    
    if ([operation isEqual:@"DEL"]) {
        NSString *currentDisplay = [display text];
        if (![currentDisplay isEqual:@""]) {
            [display setText:[currentDisplay substringToIndex:([currentDisplay length]-1)]];
            userIsInTheMiddleOfTypingANumber = YES;
        }
    }
}

@end
