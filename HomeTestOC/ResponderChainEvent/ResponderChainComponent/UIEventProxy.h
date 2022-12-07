//
//  UIEventProxy.h
//  HomeTestOC
//
//  Created by wangbo on 2022/12/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIEventProxy : UIResponder

- (void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
