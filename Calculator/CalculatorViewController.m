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
    NSRange rangeDisplay = [display.text rangeOfString:@"."];
    NSRange rangeDigit = [digit rangeOfString:@"."];
    decimalPointAlreadyPressed = rangeDisplay.location == NSNotFound?NO:YES;
    decimalPointPressed = rangeDigit.location == NSNotFound?NO:YES;

    NSLog(@"decimalPointAlreadPressed = %@", decimalPointAlreadyPressed?@"YES":@"NO");

    NSLog(@"decimalPointPressed = %@", decimalPointPressed?@"YES":@"NO");
    
    if (userIsInTheMiddleOfTypingANumber) {        
        if (decimalPointAlreadyPressed && decimalPointPressed){
            NSLog(@"Decimal EXISTED before!");
            
        } else {
            [display setText:[[display text] stringByAppendingString:digit]];
        }


    } else {
        [display setText:digit];
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

-(void)operationPressed:(UIButton *)sender{
    
    if (userIsInTheMiddleOfTypingANumber) {
        [[self brain] setOperand:[[display text] doubleValue]];
         userIsInTheMiddleOfTypingANumber = NO;
        
    }

    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
    
    if ([operation isEqual:@"C"]) {
        userIsInTheMiddleOfTypingANumber = NO;
        decimalPointAlreadyPressed = NO;
        [memoryOnDisplay setText:@""];
        NSLog(@"Clear was pressed");
    }
    
    if ([operation isEqual:@"M"]) {
        [memoryOnDisplay setText:@"M"];
        NSLog(@"Memory pressed");
    }

}


@end
