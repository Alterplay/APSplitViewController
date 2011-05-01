//
//  APBaseSplitViewController.h
//  SplitSample
//
//  Created by slatvick on 2/15/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APBaseSplitViewController : UIViewController 
{
    UINavigationController *_master;
    UINavigationController *_detail;
    UIView *_devider;
}

@property (nonatomic, readonly) UINavigationController *master;
@property (nonatomic, readonly) UINavigationController *detail;

- (void) setMasterController:(UIViewController *)controller;
- (void) setDetailController:(UIViewController *)controller;

@end