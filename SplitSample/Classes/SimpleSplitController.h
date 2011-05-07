//
//  ConcreteSplitController1.h
//  SplitSample
//
//  Created by slatvick on 3/12/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APSplitViewController.h"

@interface SimpleSplitController : APSplitViewController {
}

@property (nonatomic, retain) UIViewController *left;
@property (nonatomic, retain) UIViewController *right;

@end