//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Vassilis Papakonstantinou on 11/7/11.
//  Copyright (c) 2011 Eugenides Foundation & Eugenides Group. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

@synthesize valueStoredInMemory;

-(void)setOperand:(double)anOperand {
    operand = anOperand;
}

-(void)performWaitingOperation{
    if ([@"+" isEqual:waitingOperation]) {
        operand = waitingOperand + operand;
    } else if ([@"-" isEqual:waitingOperation]) {
        operand = waitingOperand - operand;
    } else if ([@"*" isEqual:waitingOperation]) {
        operand = waitingOperand * operand;
    } else if ([@"/" isEqual:waitingOperation]) {
        if (operand) {
            operand = waitingOperand / operand;
        }
    }
}

-(double)performOperation:(NSString *)operation {
    if ([operation isEqual:@"sqrt"]) {
        operand = sqrt(operand);
    } else if ([operation isEqual:@"1/x"]){
        operand = 1 / (operand);
    } else if ([operation isEqual:@"sin()"]) {
        operand = sin(operand);
    } else if ([operation isEqual:@"cos()"]) {
        operand = cos(operand);
    } else if ([operation isEqual:@"cos()"]) {
        operand = cos(operand);
    } else if ([operation isEqual:@"+/-"]) {
        operand = - operand;
    } else if ([operation isEqual:@"C"]) {
        operand = 0;
        waitingOperand = 0;
        waitingOperation = nil;
        valueStoredInMemory = 0;
        // add code to clear the memory
        
    } else if ([operation isEqual:@"."]) {
        NSString *integerPart = [NSString stringWithFormat:@"%g", operand];
        NSRange range = [integerPart rangeOfString:@"."];
        if (range.location == NSNotFound) {
            if (!waitingOperand){
                waitingOperand = 0;
            }
            //code here to start typing numbers after decimal point
            
            
        } else {
            //code here if decimal point already exists and another one is attempted
        }
    } else if ([operation isEqual:@"M"]) {
        valueStoredInMemory = waitingOperand;
        NSLog(@"The value in memory is: %f", valueStoredInMemory);
    } else if ([operation isEqual:@"M+"]) {
        valueStoredInMemory += waitingOperand;
    } else if ([operation isEqual:@"RM"]) {
        operand = valueStoredInMemory;
    } else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}


@end
