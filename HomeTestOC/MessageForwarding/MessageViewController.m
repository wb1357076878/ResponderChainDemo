//
//  MessageViewController.m
//  HomeTestOC
//
//  Created by wangbo on 2022/12/7.
//

#import "MessageViewController.h"
#import "TestObject.h"
#import <objc/runtime.h>

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(myTest)];
    [[MessageViewController class] performSelector:@selector(logClassMethod)];
}

//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"func name = %s", __func__);
//    if (aSelector == @selector(myTest)) {
//        TestObject *obj = [TestObject new];
//        return obj;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    NSLog(@"func name = %s", __func__);

    if (!signature) {
        if ([TestObject instancesRespondToSelector:aSelector]) {
            signature = [TestObject instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"func name = %s", __func__);
    if ([TestObject instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[TestObject new]];
    }
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    Class metaClass = objc_getMetaClass(class_getName(self));
    IMP imp = [self instanceMethodForSelector:@selector(myClassMethod)];
    if (sel == @selector(logClassMethod)) {
        class_addMethod(metaClass, sel, imp, "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

- (void)myClassMethod {
    NSLog(@"func name = %s", __func__);
}

@end
