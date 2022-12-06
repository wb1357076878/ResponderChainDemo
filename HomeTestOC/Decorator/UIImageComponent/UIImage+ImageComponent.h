//
//  UIImage+ImageComponent.h
//  HomeTestOC
//
//  Created by wangbo on 2022/12/5.
//

#import <UIKit/UIKit.h>
#import "ImageComponent.h"


@interface UIImage (ImageComponent) <ImageComponent>

- (UIImage * _Nonnull)imageAtRect:(CGRect)rect;

@end

