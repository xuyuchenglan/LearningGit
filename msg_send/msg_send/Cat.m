//
//  Cat.m
//  msg_send
//
//  Created by 李伟 on 2019/3/4.
//  Copyright © 2019年 涵信科技. All rights reserved.
//

#import "Cat.h"
#import <objc/runtime.h>

@implementation Cat

//该代理方法就是告诉NSKeyedArchiver这个类，我需要归档哪些属性
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //利用Runtime来归档
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        [aCoder encodeObject:[self valueForKey:ivarName] forKey:ivarName];
    }
    
    //释放内存
    free(ivars);
}

//该方法是告诉NSKeyedUnarchiver这个类，我需要解档哪些属性
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        //利用Runtime来解档
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(self.class, &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
            id value = [aDecoder decodeObjectForKey:ivarName];
            [self setValue:value forKey:ivarName];//注意，这里一定要通过KVC来设置
        }
        
        //释放内存
        free(ivars);
    }
    return self;
}

@end
