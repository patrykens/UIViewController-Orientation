//
//  OrientationHandler.m
//  no.pl
//
//  Created by scruffy on 7/5/13.
//  Copyright (c) 2013 CocoLab.pl. All rights reserved.
//

#import "OrientationHandler.h"


@interface OrientationHandler ()
@property (nonatomic, assign) UIInterfaceOrientation interfaceOrientation;
@end

@implementation OrientationHandler


+ (OrientationHandler *)sharedHandler {
    static OrientationHandler *_sharedHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedHandler = [[OrientationHandler alloc] init];
    });
    
    return _sharedHandler;
}

- (void)setCurrentOrientation:(UIInterfaceOrientation)currentOrientation {
    self.interfaceOrientation = currentOrientation;
}

- (UIInterfaceOrientation)currentOrientation {
    return self.interfaceOrientation;
}



@end
