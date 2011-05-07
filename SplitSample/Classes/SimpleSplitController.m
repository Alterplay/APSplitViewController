//
//  ConcreteSplitController1.m
//  SplitSample
//
//  Created by slatvick on 3/12/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import "SimpleSplitController.h"

@interface SimpleSplitController()
- (UIColor *) randomColor;
- (UIViewController*) randomViewController1;
- (UIViewController*) randomViewController2;
- (void) buttonPushRandomViewController1;
- (void) buttonPushRandomViewController2;
@end

@implementation SimpleSplitController

@synthesize left, right;

- (void)dealloc {
    self.left = nil;
    self.right = nil;

    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.left = [self randomViewController1];
    self.right = [self randomViewController2];
    
    [self pushToMasterController:self.left];
    [self pushToDetailController:self.right];
    
    self.left.title = @"Left root";
    self.right.title = @"Right root";
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.left = nil;
    self.right = nil;
}

#pragma mark - Helpers

- (UIColor *) randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (UIViewController*) randomViewController1 {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [self randomColor];    
    viewController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Push"
                                                                                         style:UIBarButtonItemStyleBordered 
                                                                                        target:self 
                                                                                        action:@selector(buttonPushRandomViewController1)] autorelease];   
    
    return [viewController autorelease];
}

- (UIViewController*) randomViewController2 {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [self randomColor];
    viewController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Push"
                                                                                         style:UIBarButtonItemStyleBordered 
                                                                                        target:self 
                                                                                        action:@selector(buttonPushRandomViewController2)] autorelease];
    return [viewController autorelease];
}

- (void) buttonPushRandomViewController1 {
    UIViewController *randomViewController = [self randomViewController1];
    randomViewController.title = @"First";
    [self.master pushViewController:randomViewController animated:YES];
}

- (void) buttonPushRandomViewController2 {
    UIViewController *randomViewController = [self randomViewController2];
    randomViewController.title = @"Second";
    [self.detail pushViewController:randomViewController animated:YES];
}

@end