//
//  APNavigationControllerFotSplitController.h
//  APSplitSample
//
//  Created by Slava on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// ABOUT
// 1. send messages on pushing and poping subcontrollers
// 2. it's used in the APSplitViewController as container-controller for content–controllers

#import <UIKit/UIKit.h>

@protocol APSplitViewDelegate;

@interface APNavigationControllerForSplitController : UINavigationController {
}

@property (nonatomic, readonly) id<APSplitViewDelegate> splitDelegate;

- (id)initWithSplit:(id<APSplitViewDelegate>)splitDelegate;

@end