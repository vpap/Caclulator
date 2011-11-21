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
@synthesize decimalOperand;

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
        if (operand!=0) {
            operand = waitingOperand / operand;
        } else {
            //Write error message
//            [memoryOnDisplay setText:@"M"];
        }
    } 
}

-(double)performOperation:(NSString *)operation {
    if ([operation isEqual:@"sqrt"]) {
        if (operand >= 0) {
            operand = sqrt(operand);            
        } else {
            //Print error message
        }

    } else if ([operation isEqual:@"1/x"]){
        if (operand != 0){
            operand = 1 / (operand);
        } else {
            //Print error message
        }
    } else if ([operation isEqual:@"sin()"]) {
        operand = sin(operand);
    } else if ([operation isEqual:@"cos()"]) {
        operand = cos(operand);
    } else if ([operation isEqual:@"+/-"]) {
        operand = - operand;
    } else if ([operation isEqual:@"C"]) {
        operand = 0;
        waitingOperand = 0;
        waitingOperation = nil;
        valueStoredInMemory = 0;
    } else if ([operation isEqual:@"M"]) {
        if (operand){
            valueStoredInMemory = operand;
        } else {
            valueStoredInMemory = waitingOperand;
        }
        NSLog(@"The value in memory is: %f", valueStoredInMemory);
    } else if ([operation isEqual:@"M+"]) {
        if (operand){
            valueStoredInMemory += operand;
        } else {
            valueStoredInMemory += waitingOperand;
        }
        NSLog(@"The value in memory is: %f", valueStoredInMemory);
    } else if ([operation isEqual:@"RM"]) {
        operand = valueStoredInMemory;
    } else if ([operation isEqual:@"CM"]){
        valueStoredInMemory = 0;
    } else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    
    return operand;
}

@end
