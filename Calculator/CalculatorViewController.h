//
//  MBLViewController.h
//  Calculator
//
//  Created by Vassilis Papakonstantinou on 11/7/11.
//  Copyright (c) 2011 Eugenides Foundation & Eugenides Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController

{
    CalculatorBrain *brain;
    IBOutlet UILabel *display;
    IBOutlet UILabel *memoryOnDisplay;
    BOOL userIsInTheMiddleOfTypingANumber;
    BOOL decimalPointAlreadyPressed;
    BOOL decimalPointPressed;
    
}

-(IBAction)digitPressed:(UIButton *)sender;
-(IBAction)operationPressed:(UIButton *)sender;


@end
