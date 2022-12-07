//
//  ImageTransformFilter.h
//  HomeTestOC
//
//  Created by wangbo on 2022/12/6.
//

#import "ImageFilter.h"

@interface ImageTransformFilter : ImageFilter
{
    @private
    CGAffineTransform transform_;
}

@property(nonatomic, assign) CGAffineTransform transform;

- (id)initWithImageComponent:(id<ImageComponent>)component
                   transform:(CGAffineTransform)transform;
- (void)apply;

@end

