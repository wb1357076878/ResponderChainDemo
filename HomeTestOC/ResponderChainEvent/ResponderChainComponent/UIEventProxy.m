//
//  UIEventProxy.m
//  HomeTestOC
//
//  Created by wangbo on 2022/12/2.
//

#import "UIEventProxy.h"
#import "UIResponder+Event.h"
#import "PicTitle.h"

extern NSString * const FNGoodsDetailEvent;
extern NSString * const FNAddToShoppingCartEvent;

@interface UIEventProxy ()

@property (nonatomic, copy) NSDictionary *eventStrategy;

@end

@implementation UIEventProxy

- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSInvocation *invocation = self.eventStrategy[eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
}

- (NSDictionary <NSString *, NSInvocation *> *)eventStrategy {
    if (!_eventStrategy) {
        _eventStrategy = @{
            FNGoodsDetailEvent: [self createInvocationWithSelector:@selector(pushToGoodsInfo)],
            FNAddToShoppingCartEvent: [[PicTitle new] createInvocationWithSelector:@selector(didClickShoppingCart:)]
        };
    }
    return _eventStrategy;
}

- (void)pushToGoodsInfo {
    NSLog(@"invocate func %s", __func__);
}

@end
