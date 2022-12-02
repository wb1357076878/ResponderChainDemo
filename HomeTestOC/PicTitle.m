//
//  PicTitle.m
//  HomeTestOC
//
//  Created by wangbo on 2022/11/23.
//

#import "PicTitle.h"
#import "UIResponder+Event.h"

@interface PicTitle ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label1;

@end

@implementation PicTitle

- (void)setModel {
    _imgView.backgroundColor = [UIColor yellowColor];
    
    [_imgView responseEventWithName:@"" userInfo:nil];
    
}

- (void)setModel1 {
    _label1.text = @"hahah";
}

@end
