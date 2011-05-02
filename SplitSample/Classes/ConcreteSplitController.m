//
//  ConcreteSplitController1.m
//  SplitSample
//
//  Created by slatvick on 3/12/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import "ConcreteSplitController.h"

@implementation ConcreteSplitController

@synthesize left, right;

- (void)dealloc
{
    self.left = nil;
    self.right = nil;

    [super dealloc];
}

#pragma mark - View lifecycle

- (UIColor *) randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (UIViewController*) randomViewController {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [self randomColor];
    return [viewController autorelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.left = [self randomViewController];
    self.right = [self randomViewController];
    
    [self pushDetailController:self.left];
    [self pushMasterController:self.right];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.left = nil;
    self.right = nil;
}

@end