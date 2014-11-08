//
//  OrientationHandler.h
//  no.pl
//
//  Created by scruffy on 7/5/13.
//  Copyright (c) 2013 CocoLab.pl. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *	Helper for whole application orientation
 */
@interface OrientationHandler : NSObject

/**
 *	Shared orientation handler
 *
 *	@return	Orientation handler shared instance
 */
+ (OrientationHandler *)sharedHandler;

/**
 *	Sets current global interface orientation
 *
 *	@param	currentOrientation	- current global interface orientation
 */
- (void)setCurrentOrientation:(UIInterfaceOrientation)currentOrientation;

/**
 *	Getter for current global interface orientation
 *
 *	@return	current interface orientation
 */
- (UIInterfaceOrientation)currentOrientation;
@end
