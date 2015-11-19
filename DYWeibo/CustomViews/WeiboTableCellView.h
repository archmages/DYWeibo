//
// Created by YuLeiming on 19/11/2015.
// Copyright (c) 2015 David.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DYWeiboFrame;


@interface WeiboTableCellView : UITableViewCell

@property (nonatomic, strong) DYWeiboFrame * weiboFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end