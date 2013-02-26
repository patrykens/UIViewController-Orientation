//
//  UIViewController+Orientation
//
//  Created by Patryk Adamkiewicz
//  Copyright (c) 2012 Patryk Adamkiewicz. All rights reserved.
//

#import "UIViewController+Orientation.h"
#import <objc/runtime.h>

static const void *iPadPortraitBlockKey = &iPadPortraitBlockKey;
static const void *iPadLandscapeBlockKey = &iPadLandscapeBlockKey;
static const void *iPhone5PortraitBlockKey = &iPhone5PortraitBlockKey;
static const void *iPhone5LandscapeBlockKey = &iPhone5LandscapeBlockKey;
static const void *iPhone4PortraitBlockKey = &iPhone4PortraitBlockKey;
static const void *iPhone4LandscapeBlockKey = &iPhone4LandscapeBlockKey;

@implementation UIViewController (Additions)

@dynamic iPadLandscapeBlock, iPadPortraitBlock, iPhone4LandscapeBlock, iPhone4PortraitBlock, iPhone5LandscapeBlock, iPhone5PortraitBlock;

#pragma mark - iPad Blocks

- (void (^)())iPadPortraitBlock
{
    return objc_getAssociatedObject(self, iPadPortraitBlockKey);
}

- (void)setIPadPortraitBlock:(void (^)())iPadPortraitBlock
{
    objc_setAssociatedObject(self, iPadPortraitBlockKey, iPadPortraitBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)())iPadLandscapeBlock
{
    return objc_getAssociatedObject(self, iPadLandscapeBlockKey);
}

- (void)setIPadLandscapeBlock:(void (^)())iPadLandscapeBlock
{
    objc_setAssociatedObject(self, iPadLandscapeBlockKey, iPadLandscapeBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - iPhone 5 Blocks

- (void (^)())iPhone5PortraitBlock
{
    return objc_getAssociatedObject(self, iPhone5PortraitBlockKey);
}

- (void)setIPhone5PortraitBlock:(void (^)())iPhone5PortraitBlock
{
    objc_setAssociatedObject(self, iPhone5PortraitBlockKey, iPhone5PortraitBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)())iPhone5LandscapeBlock
{
    return objc_getAssociatedObject(self, iPhone5LandscapeBlockKey);
}

- (void)setIPhone5LandscapeBlock:(void (^)())iPhone5LandscapeBlock
{
    objc_setAssociatedObject(self, iPhone5LandscapeBlockKey, iPhone5LandscapeBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - iPhone 4 Blocks

- (void (^)())iPhone4PortraitBlock
{
    return objc_getAssociatedObject(self, iPhone4PortraitBlockKey);
}

- (void)setIPhone4PortraitBlock:(void (^)())iPhone4PortraitBlock
{
    objc_setAssociatedObject(self, iPhone4PortraitBlockKey, iPhone4PortraitBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)())iPhone4LandscapeBlock
{
    return objc_getAssociatedObject(self, iPhone4LandscapeBlockKey);
}

- (void)setIPhone4LandscapeBlock:(void (^)())iPhone4LandscapeBlock
{
    objc_setAssociatedObject(self, iPhone4LandscapeBlockKey, iPhone4LandscapeBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Rotation Handling

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self updateInterfaceForOrientation:self.interfaceOrientation];
}

- (void)updateInterfaceForOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([DeviceSpecific deviceIsIPadFamily])
    {
        if (UIDeviceOrientationIsPortrait(self.interfaceOrientation))
        {
            if (self.iPadPortraitBlock)
                self.iPadPortraitBlock();
        }
        else if (UIDeviceOrientationIsLandscape(self.interfaceOrientation))
        {
            if (self.iPadLandscapeBlock)
                self.iPadLandscapeBlock();
        }
    }
    else if ([DeviceSpecific deviceIsIPhone5])
    {
        if (UIDeviceOrientationIsPortrait(self.interfaceOrientation))
        {
            if (self.iPhone5PortraitBlock)
                self.iPhone5PortraitBlock();
        }
        else if (UIDeviceOrientationIsLandscape(self.interfaceOrientation))
        {
            if (self.iPhone5LandscapeBlock)
                self.iPhone5LandscapeBlock();
        }
    }
    else
    {
        if (UIDeviceOrientationIsPortrait(self.interfaceOrientation))
        {
            if (self.iPhone4PortraitBlock)
                self.iPhone4PortraitBlock();
        }
        else if (UIDeviceOrientationIsLandscape(self.interfaceOrientation))
        {
            if (self.iPhone4LandscapeBlock)
                self.iPhone4LandscapeBlock();
        }
    }
}

@end
