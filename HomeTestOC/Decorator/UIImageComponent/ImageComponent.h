//
//  ImageComponent.h
//  HomeTestOC
//
//  Created by wangbo on 2022/12/5.
//

#import <UIKit/UIKit.h>

@protocol ImageComponent <NSObject>

@optional
- (void)drawAtPoint:(CGPoint)point;
- (void)drawAtPoint:(CGPoint)point
          blendMode:(CGBlendMode)blendMode
              alpha:(CGFloat)alpha;
- (void)drawInRect:(CGRect)rect;
- (void)drawInRect:(CGRect)rect
         blendMode:(CGBlendMode)blendMode
             alpha:(CGFloat)alpha;
- (void)drawAsPatternInRect:(CGRect)rect;

@end

