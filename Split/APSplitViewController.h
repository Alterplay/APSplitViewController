//
//  APBaseSplitViewController.h
//  SplitSample
//
//  Created by slatvick on 2/15/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APSplitViewController : UIViewController 
{
    UINavigationController *_master;
    UINavigationController *_detail;
    UIView *_divider;
}

@property (nonatomic, readonly) UINavigationController *master;
@property (nonatomic, readonly) UINavigationController *detail;

- (void) pushMasterController:(UIViewController *)controller;
- (void) pushDetailController:(UIViewController *)controller;

@end