//
//  APCustomTabBarController.m
//  Custom SplitViewController
//
//  Created by slatvick on 1/25/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import "APTabBarControllerForSplitController.h"
//#import "APBaseSplitViewController.h"

@implementation APTabBarControllerForSplitController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

// slatvick: it's' necessary because it's rotated automatically
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
//	BOOL isShouldRotate = [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    // Overriden to allow any orientation.
    return YES;
}

#pragma mark -
#pragma mark SEND EVENT TO NON–ACTIVE SPLITCONTROLLERS

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	for (UIViewController *ctrl in self.viewControllers) 
	{
		// uncommented to support iPhone version with standard TabBarController
//		if ([ctrl isKindOfClass:[APBaseSplitViewController class]]) 
		{
			[ctrl willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
		}
	} 
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	for (UIViewController *ctrl in self.viewControllers) 
	{
        // uncommented to support iPhone version with standard TabBarController
//		if ([ctrl isKindOfClass:[APBaseSplitViewController class]]) 
		{
			[ctrl willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
		}
	} 
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	for (UIViewController *ctrl in self.viewControllers) 
	{
        // uncommented to support iPhone version with standard TabBarController
//		if ([ctrl isKindOfClass:[APBaseSplitViewController class]]) 
		{
			[ctrl didRotateFromInterfaceOrientation:fromInterfaceOrientation];
		}
	} 
}

@end