//
//  ConcreteMasterColorList.h
//  APSplitSample
//
//  Created by Slava on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APSplitViewController.h"

@protocol ColorListMasterDelegate
- (void) colorViewDetailPoped;
@end

@interface ColorListMasterController : UITableViewController <ColorListMasterDelegate> {
    APSplitViewController *_split;
}

@property (nonatomic, readonly) UIViewController *detailViewController;
@property (nonatomic, readonly) NSMutableArray *colorList;

- (id)initWithSplit:(APSplitViewController*)split;

@end