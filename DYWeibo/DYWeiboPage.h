//
//  DYWeiboPage.h
//  DYWeibo
//
//  Created by YuLeiming on 21/11/2015.
//  Copyright © 2015 David.Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Statuses,Visible,User,Annotations;
@interface DYWeiboPage : NSObject

@property (nonatomic, strong) NSArray *ad;

@property (nonatomic, assign) BOOL hasvisible;

@property (nonatomic, assign) NSInteger interval;

@property (nonatomic, strong) NSArray *advertises;

@property (nonatomic, assign) long long previous_cursor;

@property (nonatomic, assign) NSInteger uve_blank;

@property (nonatomic, assign) NSInteger total_number;

@property (nonatomic, assign) NSInteger has_unread;

@property (nonatomic, assign) long long max_id;

@property (nonatomic, strong) NSArray *statuses;

@property (nonatomic, assign) long long next_cursor;

@property (nonatomic, assign) long long since_id;

@end
@interface Statuses : NSObject

@property (nonatomic, assign) NSInteger attitudes_count;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, assign) BOOL truncated;

@property (nonatomic, assign) NSInteger source_type;

@property (nonatomic, copy) NSString *idstr;

@property (nonatomic, copy) NSString *mid;

@property (nonatomic, strong) NSArray *annotations;

@property (nonatomic, strong) NSArray *darwin_tags;

@property (nonatomic, assign) NSInteger source_allowclick;

@property (nonatomic, copy) NSString *in_reply_to_screen_name;

@property (nonatomic, strong) Statuses *retweeted_status;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, strong) NSArray *pic_urls;

@property (nonatomic, assign) NSInteger reposts_count;

@property (nonatomic, assign) BOOL isLongText;

@property (nonatomic, assign) BOOL favorited;

@property (nonatomic, assign) NSInteger userType;

@property (nonatomic, copy) NSString *geo;

@property (nonatomic, assign) long long id;

@property (nonatomic, strong) User *user;

@property (nonatomic, copy) NSString *in_reply_to_user_id;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) NSInteger biz_feature;

@property (nonatomic, assign) NSInteger mlevel;

@property (nonatomic, copy) NSString *created_at;

@property (nonatomic, strong) Visible *visible;

@property (nonatomic, copy) NSString *in_reply_to_status_id;

@property (nonatomic, copy) NSString *rid;

@end

@interface Visible : NSObject

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger list_id;

@end

@interface User : NSObject

@property (nonatomic, copy) NSString *cover_image_phone;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger bi_followers_count;

@property (nonatomic, assign) NSInteger urank;

@property (nonatomic, copy) NSString *profile_image_url;

@property (nonatomic, assign) NSInteger class;

@property (nonatomic, copy) NSString *verified_contact_email;

@property (nonatomic, copy) NSString *province;

@property (nonatomic, copy) NSString *ability_tags;

@property (nonatomic, assign) BOOL verified;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger statuses_count;

@property (nonatomic, assign) BOOL geo_enabled;

@property (nonatomic, assign) BOOL follow_me;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger followers_count;

@property (nonatomic, copy) NSString *verified_contact_mobile;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, assign) NSInteger mbrank;

@property (nonatomic, copy) NSString *avatar_large;

@property (nonatomic, assign) NSInteger star;

@property (nonatomic, copy) NSString *verified_trade;

@property (nonatomic, copy) NSString *profile_url;

@property (nonatomic, copy) NSString *weihao;

@property (nonatomic, assign) NSInteger online_status;

@property (nonatomic, copy) NSString *verified_contact_name;

@property (nonatomic, copy) NSString *screen_name;

@property (nonatomic, copy) NSString *verified_source_url;

@property (nonatomic, assign) NSInteger pagefriends_count;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *verified_reason;

@property (nonatomic, assign) NSInteger friends_count;

@property (nonatomic, assign) NSInteger mbtype;

@property (nonatomic, assign) NSInteger block_app;

@property (nonatomic, copy) NSString *avatar_hd;

@property (nonatomic, assign) NSInteger credit_score;

@property (nonatomic, copy) NSString *remark;

@property (nonatomic, copy) NSString *created_at;

@property (nonatomic, assign) NSInteger block_word;

@property (nonatomic, assign) BOOL allow_all_act_msg;

@property (nonatomic, assign) NSInteger verified_state;

@property (nonatomic, copy) NSString *domain;

@property (nonatomic, copy) NSString *verified_reason_modified;

@property (nonatomic, assign) BOOL allow_all_comment;

@property (nonatomic, assign) NSInteger verified_level;

@property (nonatomic, copy) NSString *verified_reason_url;

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, assign) NSInteger favourites_count;

@property (nonatomic, copy) NSString *idstr;

@property (nonatomic, assign) NSInteger verified_type;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *verified_source;

@property (nonatomic, assign) NSInteger user_ability;

@property (nonatomic, copy) NSString *lang;

@property (nonatomic, assign) NSInteger ptype;

@property (nonatomic, assign) BOOL following;

@end

@interface Annotations : NSObject

@property (nonatomic, copy) NSString *client_mblogid;

@end

