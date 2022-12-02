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

@interface ViewController ()

@property(nonatomic, strong) UIEventProxy *eventProxy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PicTitle *model = [[PicTitle alloc] init];
    
    VZFStackView *view1 = (VZFStackView *)[[NSBundle mainBundle] loadNibNamed:@"PictitleView" owner:model options:nil].firstObject;
    view1.frame = CGRectMake(100, 200, 100, 120);
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    [model setModel];
    
    VZFStackView *view2 = (VZFStackView *)[[NSBundle mainBundle] loadNibNamed:@"PictitleView" owner:model options:nil].lastObject;
    view2.frame = CGRectMake(100, 400, 200, 220);
    view2.backgroundColor = [UIColor purpleColor];
    
    [model setModel1];
    [self.view addSubview:view2];
    
}

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


@end