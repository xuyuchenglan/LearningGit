//
//  Dog.h
//  msg_send
//
//  Created by 李伟 on 2019/3/4.
//  Copyright © 2019年 涵信科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"

NS_ASSUME_NONNULL_BEGIN

//Dog.h
@interface Dog : NSObject<NSCoding>

@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)NSInteger age;
@property (nonatomic, assign)float points;

@property (nonatomic, strong)Cat *cat;

@end

NS_ASSUME_NONNULL_END
