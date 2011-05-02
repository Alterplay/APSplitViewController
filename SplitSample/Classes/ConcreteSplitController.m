//
//  ConcreteSplitController1.m
//  SplitSample
//
//  Created by slatvick on 3/12/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import "ConcreteSplitController.h"

@interface ConcreteSplitController()
- (UIColor *) randomColor;
- (UIViewController*) randomViewController;
- (void) addPushButton:(UIViewController*)viewController;
- (void) buttonPushRandomViewController;
@end

@implementation ConcreteSplitController

@synthesize left, right;

- (void)dealloc {
    self.left = nil;
    self.right = nil;

    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.left = [self randomViewController];
    self.right = [self randomViewController];
    
    [self pushMasterController:self.left];
    [self pushDetailController:self.right];
    
    self.left.title = @"Master";
    self.right.title = @"Detail root";
    
    [self addPushButton:self.right];
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

- (UIViewController*) randomViewController {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [self randomColor];
    return [viewController autorelease];
}

- (void) addPushButton:(UIViewController*)viewController {
    UINavigationItem *navigationItem = viewController.navigationItem;
    navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Push"
                                                                          style:UIBarButtonItemStyleBordered 
                                                                         target:self 
                                                                         action:@selector(buttonPushRandomViewController)] autorelease];   
}

- (void) buttonPushRandomViewController {
    UIViewController *randomViewController = [self randomViewController];
    randomViewController.title = @"Detail";
    [self addPushButton:randomViewController];
    [self.detail pushViewController:randomViewController animated:YES];
}

@end