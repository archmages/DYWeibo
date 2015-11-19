//
//  NSWeibos.m
//  DYWeibo
//
//  Created by YuLeiming on 19/11/2015.
//  Copyright © 2015 David.Yu. All rights reserved.
//

#import "NSWeibos.h"

@implementation NSWeibos


+ (NSDictionary *)objectClassInArray{
    return @{@"statuses" : [NSWeibo class]};
}
@end
@implementation NSWeibo

+ (NSDictionary *)objectClassInArray{
    return @{@"pic_urls" : [PicUrls class]};
}

@end


@implementation Visible

@end


@implementation User

@end


@implementation PicUrls

@end


