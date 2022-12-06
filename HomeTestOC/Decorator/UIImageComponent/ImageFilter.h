//
//  ImageFilter.h
//  HomeTestOC
//
//  Created by wangbo on 2022/12/5.
//

#import <Foundation/Foundation.h>
#import "ImageComponent.h"

@interface ImageFilter : NSObject <ImageComponent>
{
    @private
    __strong id<ImageComponent> component_;
    
}

@property (nonatomic, strong) id<ImageComponent> component;

- (void)apply;

- (id)initWithImageComponent:(id<ImageComponent>)component;

- (id)forwardingTargetForSelector:(SEL)aSelector;

@end
