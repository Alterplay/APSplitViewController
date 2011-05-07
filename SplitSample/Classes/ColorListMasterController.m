//
//  ConcreteMasterColorList.m
//  APSplitSample
//
//  Created by Slava on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ColorListMasterController.h"

@interface ColorListMasterController()
- (UIColor *) randomColor;
- (UIViewController*)randomViewController;
- (void) buttonPushRandomViewController;
@end

@implementation ColorListMasterController

@synthesize colorList = _colorList;
@synthesize detailViewController = _detailViewController;

- (id)initWithSplit:(APSplitViewController*)split
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
        _split = [split retain];
        
        // init detail
        _detailViewController = [[self randomViewController] retain];
        _detailViewController.title = @"Detail root";
        [_split pushToDetailController:self.detailViewController];
        
        // init list of color with root detail's color
        _colorList = [[NSMutableArray alloc] initWithObjects:self.detailViewController.view.backgroundColor, nil];
    }
    return self;
}

- (void)dealloc
{
    [_split release];
    [_detailViewController release];
    [_colorList release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Push"
                                                                               style:UIBarButtonItemStyleBordered 
                                                                              target:self 
                                                                              action:@selector(buttonPushRandomViewController)] autorelease];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    [_detailViewController release];
    _detailViewController = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colorList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }

    UIColor *color = [self.colorList objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Colored Detail #%d", indexPath.row];
    cell.textLabel.backgroundColor = color;
    cell.contentView.backgroundColor = color;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)popToRowNumber:(int)rowNumber {
    
    // update color list
    int numberOfColorsToRemove = _colorList.count -rowNumber -1;
    [_colorList removeObjectsInRange:NSMakeRange(rowNumber+1, numberOfColorsToRemove)];
    
    // animate inserting to tableView
    NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:numberOfColorsToRemove];
    for (int i=0; i<numberOfColorsToRemove; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:_colorList.count+i inSection:0];
        [indexPaths addObject:index];
    }
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // update details view
    UIViewController *controller = [_split.detail.viewControllers objectAtIndex:indexPath.row];
    [_split.detail popToViewController:controller animated:YES];
    [self popToRowNumber:indexPath.row];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

#pragma mark - ColorListMasterDelegate events

- (void) colorViewDetailPoped {
    if (_colorList.count > 1)
        [self popToRowNumber:_colorList.count-2];
}

#pragma mark - Helpers

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (UIViewController*)randomViewController {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [self randomColor];
    return [viewController autorelease];
}

- (void) buttonPushRandomViewController {
    
    // get and push random controller
    UIViewController *randomViewController = [self randomViewController];
    randomViewController.title = [NSString stringWithFormat:@"Detail #%d", [_colorList count]];
    [_split.detail pushViewController:randomViewController animated:YES];
    
    // update color list
    [_colorList addObject:randomViewController.view.backgroundColor];
    
    // animate inserting to tableView
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_colorList.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
                          withRowAnimation:UITableViewRowAnimationTop];
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

@end