//
//  PicTitle.h
//  HomeTestOC
//
//  Created by wangbo on 2022/11/23.
//

#import <UIKit/UIKit.h>

@class VZFStackView;
NS_ASSUME_NONNULL_BEGIN

@interface PicTitle : UIResponder

- (VZFStackView *)getSVWithFrame:(CGRect)frame;
- (void)setModel;
- (void)setModel1;
- (void)didClickShoppingCart:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
