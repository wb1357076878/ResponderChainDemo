//
//  ViewController.m
//  HomeTestOC
//
//  Created by wangbo on 2022/11/23.
//

#import "ViewController.h"
#import "VZFStackView.h"
#import "PicTitle.h"
#import "UIResponder+Event.h"
#import "UIEventProxy.h"
#import "UIImage+YYAdd.h"

@interface ViewController ()

@property(nonatomic, strong) UIEventProxy *eventProxy;
@property(nonatomic, strong) UIImageView *currentIV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PicTitle *obj = [[PicTitle alloc] init];
    
    VZFStackView *view2 = [obj getSVWithFrame:CGRectMake(100, 400, 200, 220)];
    view2.backgroundColor = [UIColor purpleColor];
    [obj setModel1];
    [self.view addSubview:view2];
    
//    UIImageView *baseIV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 60, 236, 341)];
//    baseIV.image = [UIImage imageNamed:@"guimie"];
//    [self.view addSubview:baseIV];
    
    UIImage *subImage = [[UIImage imageNamed:@"guimie"] imageByResizeToSize:CGSizeMake(100, 144.5)];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 100, 144.5)];
    iv.image = subImage;
    iv.contentMode = UIViewContentModeCenter;
    iv.clipsToBounds = YES;
    [self.view addSubview:iv];
    self.currentIV = iv;
    UIImage *subImage1 = [subImage imageByInsetEdge:UIEdgeInsetsMake(20, 20, 40, 20) withColor:nil];
    UIImageView *subIv2 = [[UIImageView alloc] initWithFrame:CGRectMake(20+20, 20+40, 60, 84.5)];
    subIv2.image = subImage1;
    subIv2.contentMode = UIViewContentModeCenter;
    [self.view addSubview:subIv2];

    [self performSelector:@selector(imageAnimation:) withObject:iv afterDelay:5];
}

-(void)imageAnimation:(UIImageView *)iv {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [iv.layer addAnimation:transition forKey:@"a"];
    [iv setImage:[UIImage imageNamed:@"guimie-2"]];
}
- (IBAction)changeImg:(id)sender {
    CAAnimation *currentAnimation = [self.currentIV.layer animationForKey:@"a"];
    if (currentAnimation) {
        [self.currentIV.layer addAnimation:currentAnimation forKey:@"a"];
    } else {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.5;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        [self.currentIV.layer addAnimation:transition forKey:@"a"];
    }
    [self.currentIV setImage:[UIImage imageNamed:@"guimie"]];
}


@end
