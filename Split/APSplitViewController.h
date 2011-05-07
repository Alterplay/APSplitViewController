//
//  APBaseSplitViewController.h
//  SplitSample
//
//  Created by slatvick on 2/15/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APNavigationControllerForSplitController.h"

@protocol APSplitViewDelegate<NSObject>
@optional
- (void)navigationController:(UINavigationController*)navigationController popedDetailController:(UIViewController*)popedController;
@end

@interface APSplitViewController : UIViewController <APSplitViewDelegate> {
    UIView *_divider;
}

@property (nonatomic, readonly) APNavigationControllerForSplitController *master;
@property (nonatomic, readonly) APNavigationControllerForSplitController *detail;

- (void) pushToMasterController:(UIViewController *)controller;
- (void) pushToDetailController:(UIViewController *)controller;

@end