//
//  DecoratorView.h
//  HomeTestOC
//
//  Created by wangbo on 2022/12/6.
//

#import <UIKit/UIKit.h>
#import "ImageComponent.h"
NS_ASSUME_NONNULL_BEGIN

@interface DecoratorView : UIView
{
    @private
    __strong id<ImageComponent> image_;
}
@property (nonatomic, strong) id<ImageComponent> image;

@end

NS_ASSUME_NONNULL_END
