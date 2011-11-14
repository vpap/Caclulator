//
//  MBLAppDelegate.h
//  Calculator
//
//  Created by Vassilis Papakonstantinou on 11/7/11.
//  Copyright (c) 2011 Eugenides Foundation & Eugenides Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalculatorViewController;

@interface MBLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CalculatorViewController *viewController;

@end
