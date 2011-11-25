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

@synthesize errorMessageDisplay; 
@synthesize brainError;

-(CalculatorBrain *) brain{
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
        
        //Way to tranafer the error from brain to CVController
        //self.brainError = self.brain.errorMessage;
    }
    return brain;
}

-(IBAction)digitPressed:(UIButton *)sender{
    errorMessageDisplay.text = @"";
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
            errorMessageDisplay.text = self.brain.errorMessage;
        } else {
            [display setText:[[display text] stringByAppendingString:digit]];
        }

    } else {
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

-(IBAction)operationPressed:(UIButton *)sender{
    errorMessageDisplay.text = @"";
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
    if (self.brain.errorMessage){
        errorMessageDisplay.text = self.brain.errorMessage;
    }
    
    
    //Various special conditions
    
    if ([operation isEqual:@"C"]) {
        userIsInTheMiddleOfTypingANumber = NO;
        decimalPointAlreadyPressed = NO;
        [memoryOnDisplay setText:@""];
        errorMessageDisplay.text = @"";
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
