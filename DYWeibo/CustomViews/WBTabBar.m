//
//  WBTabBar.m
//  DYWeibo
//
//  Created by YuLeiming on 5/12/2015.
//  Copyright © 2015 David.Yu. All rights reserved.
//

#import "WBTabBar.h"

@interface WBTabBar()

@property (nonatomic, strong) UIButton * plusButton;

@end

@implementation WBTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.plusButton = ({
            UIButton * button = [[UIButton alloc] init];
            [button setImage:[UIImage imageNamed:@"com_bt_tab_add_normal"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"com_bt_tab_add_pressed"] forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            button;
        });
    }

    return self;
}

#pragma mark 中间加号按钮点击事件
- (void)plusClick {
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]){
        [self.tabBarDelegate tabBarDidClickPlusButton:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    // 2.设置其它UITabBarButton的位置和尺寸
    CGFloat tabbarButtonW = self.frame.size.width / 5;
    CGFloat tabbarButtonIndex = 0;

    CGRect plusButtonFrame = _plusButton.frame;
    plusButtonFrame.size = CGSizeMake(tabbarButtonW, self.frame.size.height);
    plusButtonFrame.origin = CGPointMake(tabbarButtonW * 2, 0);
    _plusButton.frame = plusButtonFrame;

    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置宽度
            CGRect frame = child.frame;
            CGFloat height = frame.size.height;
            frame.size = CGSizeMake(tabbarButtonW, height);
            frame.origin = CGPointMake(tabbarButtonIndex * tabbarButtonW, 0);
            child.frame = frame;

            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}

@end
