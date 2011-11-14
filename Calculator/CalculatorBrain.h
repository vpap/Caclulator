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
    NSString *waitingOperation;
    double waitingOperand;
    NSArray *calculatorMemory;
}

@property (readwrite) double valueStoredInMemory;

-(void)performWaitingOperation;
-(void)setOperand:(double)anOperand;
-(double)performOperation:(NSString *)operation;

@end
