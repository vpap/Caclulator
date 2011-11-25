//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Vassilis Papakonstantinou on 11/7/11.
//  Copyright (c) 2011 Eugenides Foundation & Eugenides Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

{
    double operand;
    double valueStoredInMemory;
    double waitingOperand;
    NSString *waitingOperation;
    NSString *errorMessage;
}

@property (readwrite) double valueStoredInMemory;
@property (readwrite) double operand;
@property (readwrite) double waitingOperand;
@property (retain) NSString *waitingOperation;
@property (retain) NSString *errorMessage;

-(void)performWaitingOperation;
-(double)performOperation:(NSString *)operation;

@end
