//
//  ImageTransformFilter.m
//  HomeTestOC
//
//  Created by wangbo on 2022/12/6.
//

#import "ImageTransformFilter.h"

@implementation ImageTransformFilter


- (id)initWithImageComponent:(id<ImageComponent>)component transform:(CGAffineTransform)transform {
    if (self = [super initWithImageComponent:component]) {
        [self setTransform:transform];
    }
    return self;
}

- (void)apply {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(context, _transform);
}

@end
