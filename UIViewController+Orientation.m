//
//  UIViewController+Orientation
//
//  Created by Patryk Adamkiewicz
//  Copyright (c) 2012 Patryk Adamkiewicz. All rights reserved.
//

#import "UIViewController+Orientation.h"
#import <objc/runtime.h>

NSString* const OrientationInterfaceWillChangeNotification = @"OrientationInterfaceWillChangeNotification";
NSString* const OrientationInterfaceDidChangeNotification = @"OrientationInterfaceDidChangeNotification";
NSString* const kNotificationObjectOrientationKey = @"kNotificationObjectOrientationKey";
NSString* const kNotificationObjectDurationKey = @"kNotificationObjectDurationKey";

static const void *iPadPortraitKey = &iPadPortraitKey;
static const void *iPadLandscapeKey = &iPadLandscapeKey;
static const void *iPhone5PortraitKey = &iPhone5PortraitKey;
static const void *iPhone5LandscapeKey = &iPhone5LandscapeKey;
static const void *iPhone4PortraitKey = &iPhone4PortraitKey;
static const void *iPhone4LandscapeKey = &iPhone4LandscapeKey;

static const void *iPadPortraitCompletionKey = &iPadPortraitCompletionKey;
static const void *iPadLandscapeCompletionKey = &iPadLandscapeCompletionKey;
static const void *iPhone5PortraitCompletionKey = &iPhone5PortraitCompletionKey;
static const void *iPhone5LandscapeCompletionKey = &iPhone5LandscapeCompletionKey;
static const void *iPhone4PortraitCompletionKey = &iPhone4PortraitCompletionKey;
static const void *iPhone4LandscapeCompletionKey = &iPhone4LandscapeCompletionKey;


@implementation UIViewController (Orientation)

#pragma mark - Orientation Notifications

- (void)postNotificationWillChangeIntefraceOrientationTo:(UIInterfaceOrientation)orientation withDuration:(NSTimeInterval)duration
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithInt:orientation], kNotificationObjectOrientationKey,
                                [NSNumber numberWithInt:duration], kNotificationObjectDurationKey,
                                nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:OrientationInterfaceWillChangeNotification object:dictionary];
}

- (void)postNotificationDidChangeInterfaceOrientationTo:(UIInterfaceOrientation)orientation
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                [NSNumber numberWithInt:orientation], kNotificationObjectOrientationKey,
                                nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:OrientationInterfaceDidChangeNotification object:dictionary];
}

- (void)signInForOrientationChanges
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateInterfaceWithNotification:) name:OrientationInterfaceWillChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(completion:) name:OrientationInterfaceDidChangeNotification object:nil];
}

- (void)signOutForOrientationChanges
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OrientationInterfaceWillChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OrientationInterfaceDidChangeNotification object:nil];
}

#pragma mark - Setters

- (void)setIPadPortraitLayout:(void(^)())layout {
    [self setIPadPortraitLayout:layout completion:nil];
}

- (void)setIPadLandscapeLayout:(void(^)())layout {
    [self setIPadLandscapeLayout:layout completion:nil];
}
- (void)setIPhone4PortraitLayout:(void(^)())layout {
    [self setIPhone4PortraitLayout:layout completion:nil];
}
- (void)setIPhone4LandscapeLayout:(void(^)())layout {
    [self setIPhone4LandscapeLayout:layout completion:nil];
}
- (void)setIPhone5PortraitLayout:(void(^)())layout {
    [self setIPhone5PortraitLayout:layout completion:nil];
}
- (void)setIPhone5LandscapeLayout:(void(^)())layout {
    [self setIPhone5LandscapeLayout:layout completion:nil];
}

- (void)setIPadPortraitLayout:(void(^)())layout completion:(void(^)())completion {
    objc_setAssociatedObject(self, iPadPortraitKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, iPadPortraitCompletionKey, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setIPadLandscapeLayout:(void(^)())layout completion:(void(^)())completion {
    objc_setAssociatedObject(self, iPadLandscapeKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, iPadLandscapeCompletionKey, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setIPhone4PortraitLayout:(void(^)())layout completion:(void(^)())completion {
    objc_setAssociatedObject(self, iPhone4PortraitKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, iPhone4PortraitCompletionKey, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setIPhone4LandscapeLayout:(void(^)())layout completion:(void(^)())completion {
    objc_setAssociatedObject(self, iPhone4LandscapeKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, iPhone4LandscapeCompletionKey, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setIPhone5PortraitLayout:(void(^)())layout completion:(void(^)())completion {
    objc_setAssociatedObject(self, iPhone5PortraitKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, iPhone5PortraitCompletionKey, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setIPhone5LandscapeLayout:(void(^)())layout completion:(void(^)())completion {
    objc_setAssociatedObject(self, iPhone5LandscapeKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, iPhone5LandscapeCompletionKey, completion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getters

- (void (^)())iPadPortrait {
    return objc_getAssociatedObject(self, iPadPortraitKey);
}

- (void (^)())iPadLandscape {
    return objc_getAssociatedObject(self, iPadLandscapeKey);
}

- (void (^)())iPhone5Portrait {
    return objc_getAssociatedObject(self, iPhone5PortraitKey);
}

- (void (^)())iPhone5Landscape {
    return objc_getAssociatedObject(self, iPhone5LandscapeKey);
}

- (void (^)())iPhone4Portrait {
    return objc_getAssociatedObject(self, iPhone4PortraitKey);
}

- (void (^)())iPhone4Landscape {
    return objc_getAssociatedObject(self, iPhone4LandscapeKey);
}

- (void (^)())iPadPortraitCompletion {
    return objc_getAssociatedObject(self, iPadPortraitCompletionKey);
}
- (void (^)())iPadLandscapeCompletion {
    return objc_getAssociatedObject(self, iPadLandscapeCompletionKey);
}

- (void (^)())iPhone5PortraitCompletion {
    return objc_getAssociatedObject(self, iPhone5PortraitCompletionKey);
}

- (void (^)())iPhone5LandscapeCompletion {
    return objc_getAssociatedObject(self, iPhone5LandscapeCompletionKey);
}

- (void (^)())iPhone4PortraitCompletion {
    return objc_getAssociatedObject(self, iPhone4PortraitCompletionKey);
}

- (void (^)())iPhone4LandscapeCompletion {
    return objc_getAssociatedObject(self, iPhone4LandscapeCompletionKey);
}

#pragma mark - Rotation Handling

- (void)updateInterface
{
    [self updateInterfaceWithNotification:nil];
    [self completion:nil];
}

- (void)updateInterfaceWithNotification:(NSNotification*)notification
{
    UIInterfaceOrientation orientation;
    if (notification) {
        NSDictionary *object = (NSDictionary*)notification.object;
        orientation =  ((NSNumber*)[object objectForKey:kNotificationObjectOrientationKey]).integerValue;
    }
    else {
        orientation = self.interfaceOrientation;
    }
    
    if ([DeviceSpecific deviceIsIPadFamily]) {
        if (UIDeviceOrientationIsPortrait(orientation)) {
            if (self.iPadPortrait) {
                self.iPadPortrait();
            }
        }
        else if (UIDeviceOrientationIsLandscape(orientation)) {
            if (self.iPadLandscape) {
                self.iPadLandscape();
            }
        }
    }
    else if ([DeviceSpecific deviceIsIPhone5]) {
        if (UIDeviceOrientationIsPortrait(orientation)) {
            if (self.iPhone5Portrait) {
                self.iPhone5Portrait();
            }
        }
        else if (UIDeviceOrientationIsLandscape(orientation)) {
            if (self.iPhone5Landscape) {
                self.iPhone5Landscape();
            }
        }
    }
    else {
        if (UIDeviceOrientationIsPortrait(orientation)) {
            if (self.iPhone4Portrait) {
                self.iPhone4Portrait();
            }
        }
        else if (UIDeviceOrientationIsLandscape(orientation)) {
            if (self.iPhone4Landscape) {
                self.iPhone4Landscape();
            }
        }
    }
}

- (void)completion:(NSNotification*)notification
{
    UIInterfaceOrientation orientation;
    if (notification) {
        NSDictionary *object = (NSDictionary*)notification.object;
        orientation =  ((NSNumber*)[object objectForKey:kNotificationObjectOrientationKey]).integerValue;
    }
    else {
        orientation = self.interfaceOrientation;
    }
    
    if ([DeviceSpecific deviceIsIPadFamily]) {
        if (UIDeviceOrientationIsPortrait(orientation)) {
            if (self.iPadPortraitCompletion) {
                self.iPadPortraitCompletion();
            }
        }
        else if (UIDeviceOrientationIsLandscape(orientation)) {
            if (self.iPadLandscapeCompletion) {
                self.iPadLandscapeCompletion();
            }
        }
    }
    else if ([DeviceSpecific deviceIsIPhone5]) {
        if (UIDeviceOrientationIsPortrait(orientation)) {
            if (self.iPhone5PortraitCompletion) {
                self.iPhone5PortraitCompletion();
            }
        }
        else if (UIDeviceOrientationIsLandscape(orientation)) {
            if (self.iPhone5LandscapeCompletion) {
                self.iPhone5LandscapeCompletion();
            }
        }
    }
    else {
        if (UIDeviceOrientationIsPortrait(orientation)) {
            if (self.iPhone4PortraitCompletion) {
                self.iPhone4PortraitCompletion();
            }
        }
        else if (UIDeviceOrientationIsLandscape(orientation)) {
            if (self.iPhone4LandscapeCompletion) {
                self.iPhone4LandscapeCompletion();
            }
        }
    }
}

@end
