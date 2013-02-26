//
//  UIViewController+Orientation
//
//  Created by Patryk Adamkiewicz
//  Copyright (c) 2012 Patryk Adamkiewicz. All rights reserved.
//

extern NSString* const OrientationInterfaceWillChangeNotification;
extern NSString* const OrientationInterfaceDidChangeNotification;
extern NSString* const kNotificationObjectOrientationKey;
extern NSString* const kNotificationObjectDurationKey;

#import <UIKit/UIKit.h>

@interface UIViewController (Orientation)

/**
 * Method which must be implemented by one ViewController in order for any layout block to be called
 */
- (void)postNotificationWillChangeIntefraceOrientationTo:(UIInterfaceOrientation)orientation withDuration:(NSTimeInterval)duration;

/**
 * Method which must be implemented by one ViewController in order for any completion block to be called
 */
- (void)postNotificationDidChangeInterfaceOrientationTo:(UIInterfaceOrientation)orientation;

/**
 * -- Signing for orientation changes --
 * Must be implemented by any View Controller which wants to have Layout or Completion blocks fired
 * Can be set either in viewDidLoad or viewWillAppear
 */
- (void)signInForOrientationChanges;

/**
 * -- Signing out for orientation changes --
 * Must be implemented by any View Controller
 * Can be set either in viewDidUnload or viewWillDisappear / viewDidDisappear
 */
- (void)signOutForOrientationChanges;

/**
 * Firing Layout block and completion block manually (usually in order to set initial layout of view)
 */
- (void)updateInterface;

/**
 * Setting Layout blocks for specific device
 */
- (void)setIPadPortraitLayout:(void(^)())layout;
- (void)setIPadLandscapeLayout:(void(^)())layout;
- (void)setIPhone4PortraitLayout:(void(^)())layout;
- (void)setIPhone4LandscapeLayout:(void(^)())layout;
- (void)setIPhone5PortraitLayout:(void(^)())layout;
- (void)setIPhone5LandscapeLayout:(void(^)())layout;

/**
 * Setting Layout and Completion blocks for specific device
 */
- (void)setIPadPortraitLayout:(void(^)())layout completion:(void(^)())completion;
- (void)setIPadLandscapeLayout:(void(^)())layout completion:(void(^)())completion;
- (void)setIPhone4PortraitLayout:(void(^)())layout completion:(void(^)())completion;
- (void)setIPhone4LandscapeLayout:(void(^)())layout completion:(void(^)())completion;
- (void)setIPhone5PortraitLayout:(void(^)())layout completion:(void(^)())completion;
- (void)setIPhone5LandscapeLayout:(void(^)())layout completion:(void(^)())completion;

@end
