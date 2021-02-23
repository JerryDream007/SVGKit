//
//  UIView+Utility.h
//  Demo-iOS
//
//  Created by 宋澎 on 2021/2/23.
//  Copyright © 2021 na. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Utility)

//  将View的顶端移动到指定位置
@property (nonatomic) CGFloat top;

//  更改View的尺寸
@property (nonatomic) CGSize size;

//  更改View中心点的位置x
@property (nonatomic) CGFloat centerX;

@end

NS_ASSUME_NONNULL_END
