//
// Created by YuLeiming on 19/11/2015.
// Copyright (c) 2015 David.Yu. All rights reserved.
//

#import "WeiboTableCellView.h"
#import "DYWeiboFrame.h"
#import "DYWeiboPage.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface WeiboTableCellView()

//微博头像
@property(nonatomic, weak) UIImageView *headView;

//用户名
@property(nonatomic, weak) UILabel *nameLabel;

//内容
@property (nonatomic, weak) UILabel *introLabel;

@end

@implementation WeiboTableCellView {


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"status";
    WeiboTableCellView * cellView = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cellView){
        cellView = [[WeiboTableCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: identifier];
    }
    return cellView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.headView = ({
            UIImageView *imageview = [[UIImageView alloc] init];
            imageview.backgroundColor = [UIColor yellowColor];
            [self.contentView addSubview:imageview];
            imageview;
        });

        self.nameLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor darkGrayColor];
            [self.contentView addSubview:label];
            label;
        });

        self.introLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor darkGrayColor];
            label.numberOfLines = 5;
            [self.contentView addSubview:label];
            label;
        });
    }

    return self;

}

- (void)setWeiboFrame:(DYWeiboFrame *)frame {
    _weiboFrame = frame;
    //绑定cell的子控件内容
    [self bindData];

    //设定cell各个子控件的大小
    [self bindFrame];
}

- (void)bindData {
    Statuses *statuses = _weiboFrame.statuses;
    _nameLabel.text = statuses.user.name;
    _introLabel.text = statuses.text;
    [_headView sd_setImageWithURL:statuses.user.avatar_hd];
}

- (void)bindFrame {
    _nameLabel.frame = _weiboFrame.nameF;
    _introLabel.frame = _weiboFrame.introF;
    _headView.frame = _weiboFrame.iconF;
}

@end