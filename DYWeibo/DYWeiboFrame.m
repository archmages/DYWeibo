//
// Created by YuLeiming on 19/11/2015.
// Copyright (c) 2015 David.Yu. All rights reserved.
//

#import "DYWeiboFrame.h"
#import "DYWeiboPage.h"
#import "MJExtension.h"

@implementation DYWeiboFrame {

}

- (void)setStatuses:(Statuses *)status {
    [User mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"desc" : @"desciption"
        };
    }];
    _statuses = [Statuses mj_objectWithKeyValues: status];
    NSMutableDictionary * statusesDict = [status mj_keyValues];
    NSMutableDictionary * userDict = statusesDict[@"user"];
    User *user = [[User alloc] init];
    user.name = userDict[@"name"];
    user.avatar_hd = userDict[@"avatar_hd"];
//    User *user = [User mj_objectWithKeyValues:userDict];
    _statuses.user = user;
    CGFloat padding = 10;

    self.iconF = ({
        CGFloat iconViewX = padding;
        CGFloat iconViewY = padding;
        CGFloat iconW = 40;
        CGFloat iconH = 40;
        CGRectMake(iconViewX, iconViewY, iconW, iconH);
    });

    self.nameF = ({
        CGFloat nameLabelX = CGRectGetMaxX(_iconF) + padding;
        CGFloat nameLabelY = padding;
        CGSize size = [self sizeWithString:_statuses.user.name font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(_screenWidth - padding,MAXFLOAT)];
        CGFloat nameLabelW = size.width;
        CGFloat nameLabelH = size.height;
        CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    });

    self.introF = ({
        CGFloat introLabelX = padding;
        CGFloat introLabelY = CGRectGetMaxY(_iconF) + padding;
        CGSize size = [self sizeWithString:_statuses.text font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(_screenWidth - padding,MAXFLOAT)];
        CGFloat nameLabelW = size.width;
        CGFloat nameLabelH = size.height;
        CGRectMake(introLabelX, introLabelY, nameLabelW, nameLabelH);
    });

    self.cellHeightF = ({
        CGRectGetMaxY(_introF) + padding;
    });
}


/**
 *  计算文本的宽高
 *
 *  @param str     需要计算的文本
 *  @param font    文本显示的字体
 *  @param maxSize 文本显示的范围
 *
 *  @return 文本占用的真实宽高
 */
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}


@end