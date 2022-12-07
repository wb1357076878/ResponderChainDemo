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
    
}



@end
