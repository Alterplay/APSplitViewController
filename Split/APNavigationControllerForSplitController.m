//
//  APNavigationControllerFotSplitController.m
//  APSplitSample
//
//  Created by Slava on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "APNavigationControllerForSplitController.h"
#import "APSplitViewController.h"

@implementation APNavigationControllerForSplitController

@synthesize splitDelegate = _splitDelegate;

- (id)initWithSplit:(id<APSplitViewDelegate>)splitDelegate {
    self = [super init];
    if (self) {
        _splitDelegate = splitDelegate;
    }
    return self;
}

- (void)dealloc {
    _splitDelegate = nil;
    [super dealloc];
}

#pragma mark - Overwrite methods

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    UIViewController *popedController = [super popViewControllerAnimated:animated];
    if ([self.splitDelegate respondsToSelector:@selector(navigationController:popedDetailController:)])
        [self.splitDelegate navigationController:self popedDetailController:popedController];
    return popedController;
}


@end