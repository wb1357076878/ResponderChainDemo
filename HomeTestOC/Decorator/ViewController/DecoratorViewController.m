//
//  DecoratorViewController.m
//  HomeTestOC
//
//  Created by wangbo on 2022/12/6.
//

#import "DecoratorViewController.h"
#import "UIImage+ImageComponent.h"
#import "ImageComponent.h"
#import "ImageTransformFilter.h"
#import "ImageShadowFilter.h"
#import "DecoratorView.h"
#import "TestObject.h"
#import <objc/runtime.h>

@interface DecoratorViewController ()

@end

@implementation DecoratorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"guimie"];
    
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(-M_PI/8.0);
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(-image.size.width / 2, image.size.height / 2);
    CGAffineTransform finalTransform = CGAffineTransformConcat(rotateTransform, translateTransform);
    
    id<ImageComponent>transformedImage = [[ImageTransformFilter alloc] initWithImageComponent:image transform:finalTransform];
    id<ImageComponent>finalImage = [[ImageShadowFilter alloc] initWithImageComponent:transformedImage];
    
    DecoratorView *decoratorView = [[DecoratorView alloc] initWithFrame:self.view.bounds];
    [decoratorView setImage:finalImage];
    [decoratorView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:decoratorView];
    
//    [self performSelector:@selector(myTest)];
//    [[DecoratorViewController class] performSelector:@selector(logClassMethod)];
}

//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"func name = %s", __func__);
//    if (aSelector == @selector(myTest)) {
//        TestObject *obj = [TestObject new];
//        return obj;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
//    NSLog(@"func name = %s", __func__);
//
//    if (!signature) {
//        if ([TestObject instancesRespondToSelector:aSelector]) {
//            signature = [TestObject instanceMethodSignatureForSelector:aSelector];
//        }
//    }
//    return signature;
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    NSLog(@"func name = %s", __func__);
//    if ([TestObject instancesRespondToSelector:anInvocation.selector]) {
//        [anInvocation invokeWithTarget:[TestObject new]];
//    }
//}
//
//+ (BOOL)resolveClassMethod:(SEL)sel {
//    Class metaClass = objc_getMetaClass(class_getName(self));
//    IMP imp = [self instanceMethodForSelector:@selector(myClassMethod)];
//    if (sel == @selector(logClassMethod)) {
//        class_addMethod(metaClass, sel, imp, "v@:");
//        return YES;
//    }
//    return [super resolveClassMethod:sel];
//}
//
//- (void)myClassMethod {
//    NSLog(@"func name = %s", __func__);
//}

@end
