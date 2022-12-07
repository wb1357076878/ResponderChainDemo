//
//  PicTitle.m
//  HomeTestOC
//
//  Created by wangbo on 2022/11/23.
//

#import "PicTitle.h"
#import "UIResponder+Event.h"
#import "VZFStackView.h"

extern NSString * const FNGoodsDetailEvent;
extern NSString * const FNAddToShoppingCartEvent;

@interface PicTitle ()

@property (strong, nonatomic) IBOutlet VZFStackView *stackView1;
@property (strong, nonatomic) IBOutlet VZFStackView *stackView2;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label1;

@end

@implementation PicTitle

- (VZFStackView *)getSVWithFrame:(CGRect)frame {
    self.stackView2 = [[NSBundle mainBundle] loadNibNamed:@"PictitleView" owner:self options:nil].firstObject;
    self.stackView2.frame = frame;
    return self.stackView2;
}

- (void)setModel {
    _imgView.backgroundColor = [UIColor yellowColor];
}

- (void)setModel1 {
    _label1.text = @"hahah";
}

- (void)didClickShoppingCart:(NSDictionary *)userInfo {
    NSLog(@"userInfo = %@",userInfo);
    NSLog(@"add to shopping cart successful!");
}
- (IBAction)goodsInfo:(id)sender {
    [self responseEventWithName:FNGoodsDetailEvent userInfo:nil];

}

- (IBAction)shopping:(id)sender {
    [self responseEventWithName:FNAddToShoppingCartEvent userInfo:@{@"goodsName":@"apple"}];

}

@end
