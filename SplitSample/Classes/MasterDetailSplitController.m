//
//  ConcreteSplitController1.m
//  SplitSample
//
//  Created by slatvick on 3/12/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import "MasterDetailSplitController.h"

@implementation MasterDetailSplitController

@synthesize masterViewController = _masterViewController;

- (void)dealloc {
    [_masterViewController release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _masterViewController = [[ColorListMasterController alloc] initWithSplit:self];
    self.masterViewController.title = @"Master: colors";
    [self pushToMasterController:self.masterViewController];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    [_masterViewController release];
    _masterViewController = nil;
}

#pragma mark - APSplitViewDelegate events

- (void)navigationController:(UINavigationController*)navigationController popedDetailController:(UIViewController*)popedController {
    if ([navigationController isEqual:self.detail]) {
        [self.masterViewController colorViewDetailPoped];
    }
}

@end