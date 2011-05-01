//
//  ConcreteSplitController1.m
//  SplitSample
//
//  Created by slatvick on 3/12/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import "ConcreteSplitController1.h"

@implementation ConcreteSplitController1

- (void)dealloc
{
    [_left release];
    [_right release];

    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _left = [[UIViewController alloc] init];
    _left.view.backgroundColor = [UIColor yellowColor];
    
    _right = [[UIViewController alloc] init];
    _right.view.backgroundColor = [UIColor blueColor];
    
    [self setDetailController:_left];
    [self setMasterController:_right];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [_left release], _left = nil;
    [_right release], _right = nil;
}

@end