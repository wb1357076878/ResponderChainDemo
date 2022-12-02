//
//  UIResponder+Event.m
//  HomeTestOC
//
//  Created by wangbo on 2022/12/2.
//

#import "UIResponder+Event.h"

@implementation UIResponder (Event)

- (void)responseEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    
    [[self nextResponder] responseEventWithName:eventName userInfo:userInfo];
}

@end
