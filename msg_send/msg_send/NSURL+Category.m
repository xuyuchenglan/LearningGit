//
//  NSURL+Category.m
//  msg_send
//
//  Created by 李伟 on 2019/3/6.
//  Copyright © 2019年 涵信科技. All rights reserved.
//

#import "NSURL+Category.h"
#import <objc/runtime.h>

@implementation NSURL (Category)

+(void)load
{
    Method originalMethod = class_getClassMethod(self.class, @selector(URLWithString:));
    Method currentMethod = class_getClassMethod(self.class, @selector(norman_URLWithString:));
    method_exchangeImplementations(originalMethod, currentMethod);
}

+ (nullable instancetype)norman_URLWithString:(NSString *)URLString
{
    NSURL *url = [self norman_URLWithString:URLString];
    if (!url) {
        NSLog(@"URLWithString生成的url不存在");
    }
    return url;
}

@end
