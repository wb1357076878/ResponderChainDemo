//
//  UIImage+ImageComponent.m
//  HomeTestOC
//
//  Created by wangbo on 2022/12/5.
//

#import "UIImage+ImageComponent.h"

@implementation UIImage (ImageComponent)

- (UIImage * _Nonnull)imageAtRect:(CGRect)rect {
    CGRect realRect;
//    if (rect.origin.x != 0 && rect.origin.y != 0) {
//        realRect = CGRectMake(0, 0, rect.size.width * self.scale, rect.size.height * self.scale);
//    } else {
        realRect = CGRectMake(rect.origin.x * self.scale, rect.origin.y * self.scale, rect.size.width * self.scale, rect.size.height * self.scale);
//    }
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], realRect);
    UIImage *subImage = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    
    return subImage;
}

@end
