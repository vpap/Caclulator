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
    NSString *operationStatus;
    float decimalOperand;
    double valueStoredInMemory;
    NSString *waitingOperation;
    double waitingOperand;
    NSArray *calculatorMemory;
}

@property (readwrite) double valueStoredInMemory;
@property (readwrite) float decimalOperand; 

-(void)performWaitingOperation;
-(void)setOperand:(double)anOperand;
-(double)performOperation:(NSString *)operation;

@end
