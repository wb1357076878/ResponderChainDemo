//
//  UIResponder+Event.h
//  HomeTestOC
//
//  Created by wangbo on 2022/12/2.
//

#import <UIKit/UIKit.h>


@interface UIResponder (Event)

- (void)responseEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

