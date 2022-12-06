//
//  ImageShadowFilter.m
//  HomeTestOC
//
//  Created by wangbo on 2022/12/6.
//

#import "ImageShadowFilter.h"

@implementation ImageShadowFilter

- (void)apply {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGSize offset = CGSizeMake(-25, 15);
    CGContextSetShadow(context, offset, 20);
}

@end
