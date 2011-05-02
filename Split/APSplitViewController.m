//
//  APBaseSplitViewController.m
//  SplitSample
//
//  Created by slatvick on 2/15/11.
//  Copyright 2011 Alterplay. All rights reserved.
//

#import "APSplitViewController.h"

#define constDividerWidth 1.0f
#define constMasterWidth 320.0f
#define constDetailStartPoint (constMasterWidth+constDividerWidth)

static float koefficient = 0.0f; // Need to fix a bug with 20px near the statusbar

@interface APSplitViewController()
//- (void) layoutSubviews;
@end

@implementation APSplitViewController

@synthesize master = _master;
@synthesize detail = _detail;

#pragma mark -
#pragma mark Helpers

// returns size of split view
- (CGSize) sizeRotated {
    
	UIScreen *screen = [UIScreen mainScreen];
	CGRect bounds = screen.bounds; // always implicitly in Portrait orientation.
	CGRect appFrame = screen.applicationFrame;
	CGSize size = bounds.size;
	
	float statusBarHeight = MAX((bounds.size.width - appFrame.size.width), (bounds.size.height - appFrame.size.height));
	
	// let's figure out if width/height must be swapped
	if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) 
	{
		// we're going to landscape, which means we gotta swap them
		size.width = bounds.size.height;
		size.height = bounds.size.width;
	}
	
	size.height = size.height -statusBarHeight -self.tabBarController.tabBar.frame.size.height;
	return size;
}

- (void) layoutSubviews {
    
	NSLog(@"layoutSubviews");
	
	CGSize size = [self sizeRotated];
	
	_master.view.frame = CGRectMake(0,
                                    0 - koefficient,
                                    constMasterWidth,
                                    size.height + koefficient);
	_detail.view.frame = CGRectMake(constDetailStartPoint,
                                    0 - koefficient,
                                    size.width - constDetailStartPoint,
                                    size.height + koefficient);
	_divider.frame = CGRectMake(constMasterWidth, 0, constDividerWidth, size.height);
}

- (void) dealloc {
    [_master release];
    [_detail release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void) pushMasterController:(UIViewController *)controller {
    
	CGSize size = [self sizeRotated];
	
	controller.view.frame = CGRectMake(0, 0, constMasterWidth, size.height);
    controller.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth 
		| UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin 
		| UIViewAutoresizingFlexibleRightMargin  | UIViewAutoresizingFlexibleLeftMargin;
//	controller.view.backgroundColor = [UIColor redColor];
		
    [_master pushViewController:controller animated:NO];
	_master.view.frame = CGRectMake(0, 0, constMasterWidth, size.height);
    _master.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _master.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_master.view];
	[self.view bringSubviewToFront:_divider];
}

- (void) pushDetailController:(UIViewController *)controller {
    
	CGSize size = [self sizeRotated];
	
    controller.view.frame = CGRectMake(0, 0, size.width-constDetailStartPoint, size.height);
    controller.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
		| UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin 
		| UIViewAutoresizingFlexibleRightMargin  | UIViewAutoresizingFlexibleLeftMargin;
//	controller.view.backgroundColor = [UIColor lightGrayColor];
	

	
    [_detail pushViewController:controller animated:NO];
    _detail.view.frame = CGRectMake(constDetailStartPoint, 0, size.width-constDetailStartPoint, size.height);
    _detail.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
 //   _detail.view.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:_detail.view];
	[self.view bringSubviewToFront:_divider];
}

- (void) loadView {
    
	CGSize size = [self sizeRotated];
	
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.view = view;
	self.view.backgroundColor = [UIColor grayColor];
	
	// slatvick: old divider
	_divider = [[UIView alloc] init];
	_divider.frame = CGRectMake(constMasterWidth, 0, constDividerWidth, size.height);
	_divider.backgroundColor = [UIColor redColor];
	_divider.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:_divider];
    
    UIImage *image = [UIImage imageNamed:@"split-divider.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(-4, 0, image.size.width, image.size.height);
    [_divider addSubview:imageView];
    [imageView release];
}

- (void) viewDidLoad {
    [super viewDidLoad];

    _master = [UINavigationController new];
    _detail = [UINavigationController new];

    // don't remember what for?
	//[_master viewDidLoad];
	//[_detail viewDidLoad];
    
	
	NSLog(@"viewDidLoad complete");
//	NSLog(@"   self.view.frame: %@", NSStringFromCGRect(self.view.frame));
//	NSLog(@"_master.view.frame: %@", NSStringFromCGRect(_master.view.frame));
//	NSLog(@"_detail.view.frame: %@", NSStringFromCGRect(_detail.view.frame));
}

- (void) viewDidUnload {
    [_master release], _master = nil;
    [_detail release], _detail = nil;
}

#pragma mark -
#pragma mark STANDARD METHODS

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    
	[_master viewWillAppear:animated];
	[_detail viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[_master viewDidAppear:animated];
	[_detail viewDidAppear:animated];
    
    // it's Needed to fix a bug with 20px near the statusbar
    if (self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        koefficient = 20.0f;
    else
        koefficient = 0.0f;
    
//	[self layoutSubviews];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[_master viewWillDisappear:animated];
	[_detail viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	[_master viewDidDisappear:animated];
	[_detail viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[_master willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	[_detail willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];	
//	[self layoutSubviews];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	[_master didRotateFromInterfaceOrientation:fromInterfaceOrientation];
	[_detail didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
//    [self layoutSubviews];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[_master willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
	[_detail willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	[_master willAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
	[_detail willAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	[_master didAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation];
	[_detail didAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation];
}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation duration:(NSTimeInterval)duration {
	[_master willAnimateSecondHalfOfRotationFromInterfaceOrientation:fromInterfaceOrientation duration:duration];
	[_detail willAnimateSecondHalfOfRotationFromInterfaceOrientation:fromInterfaceOrientation duration:duration];
}

@end