//
//  VZFStackView.m
//  HomeTestOC
//
//  Created by wangbo on 2022/11/23.
//

#import "VZFStackView.h"
#import "UIResponder+Event.h"

NSString * const FNGoodsDetailEvent = @"goodsDetail";
NSString * const FNAddToShoppingCartEvent = @"shoppingCart";

@implementation VZFStackView


- (void)responseEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *touchView = self;
    if ([self pointInside:point withEvent:event] && !self.hidden && self.userInteractionEnabled) {
        for (UIView *subView in self.subviews) {
            CGPoint subPoint = [subView convertPoint:point fromView:self];
            UIView *subTouchView = [subView hitTest:subPoint withEvent:event];
            if (subTouchView) {
                touchView = subTouchView;
                break;
            }
        }
    } else  {
        touchView = nil;
    }
    return touchView;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return [super pointInside:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    
}


@end
