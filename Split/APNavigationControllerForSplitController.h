//
//  APNavigationControllerFotSplitController.h
//  APSplitSample
//
//  Created by Slava on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APSplitViewDelegate;

@interface APNavigationControllerForSplitController : UINavigationController {
}

@property (nonatomic, readonly) id<APSplitViewDelegate> splitDelegate;

- (id)initWithSplit:(id<APSplitViewDelegate>)splitDelegate;

@end