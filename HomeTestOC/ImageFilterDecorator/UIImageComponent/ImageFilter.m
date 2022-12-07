//
//  ImageFilter.m
//  HomeTestOC
//
//  Created by wangbo on 2022/12/5.
//

#import "ImageFilter.h"
#import "UIImage+ImageComponent.h"


@implementation ImageFilter

- (id)initWithImageComponent:(id<ImageComponent>)component {
    if (self = [super init]) {
        [self setComponent:component];
    }
    return self;
}

- (void)apply {
    
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSString *selectorName = NSStringFromSelector(aSelector);
    if ([selectorName hasPrefix:@"draw"]) {
        [self apply];
    }
    return _component;
}

@end
