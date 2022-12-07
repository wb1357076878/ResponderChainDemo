//
//  VZFStackView.m
//  HomeTestOC
//
//  Created by wangbo on 2022/11/23.
//

#import "VZFStackView.h"
#import "UIResponder+Event.h"
#import "UIEventProxy.h"

NSString * const FNGoodsDetailEvent = @"goodsDetail";
NSString * const FNAddToShoppingCartEvent = @"shoppingCart";

@interface VZFStackView ()

@property(nonatomic, strong) UIEventProxy *eventProxy;

@end

@implementation VZFStackView


// 事件处理
- (void)responseEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    [self.eventProxy handleEvent:eventName userInfo:userInfo];
}

- (UIEventProxy *)eventProxy {
    if (!_eventProxy) {
        _eventProxy = [[UIEventProxy alloc] init];
    }
    return _eventProxy;
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


@end
