//
//  main.m
//  msg_send
//
//  Created by 李伟 on 2019/3/4.
//  Copyright © 2019年 涵信科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Dog.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        Dog *dog = [[Dog alloc] init];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
