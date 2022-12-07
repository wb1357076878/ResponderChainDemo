//
//  DecoratorView.m
//  HomeTestOC
//
//  Created by wangbo on 2022/12/6.
//

#import "DecoratorView.h"

@implementation DecoratorView

- (void)drawRect:(CGRect)rect {
    [_image drawInRect:rect];
}

- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event {
    return [super actionForLayer:layer forKey:event];
}

@end
