//
// Created by YuLeiming on 19/11/2015.
// Copyright (c) 2015 David.Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Statuses;


@interface DYWeiboFrame : NSObject

//头像frame
@property (nonatomic, assign) CGRect iconF;

//名字frame
@property (nonatomic, assign) CGRect nameF;

//正文的frame
@property (nonatomic, assign) CGRect introF;

//行高
@property (nonatomic, assign) CGFloat cellHeightF;

//微博实体对象
@property (nonatomic, strong) Statuses * statuses;

@property (nonatomic, assign) CGFloat screenWidth;

@end