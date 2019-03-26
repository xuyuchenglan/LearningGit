//
//  ViewController.m
//  msg_send
//
//  Created by 李伟 on 2019/3/4.
//  Copyright © 2019年 涵信科技. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"

@interface Address : NSObject

@property (nonatomic, copy)  NSString* country;
@property (nonatomic, copy)  NSString* province;
@property (nonatomic, copy)  NSString* city;
@property (nonatomic, copy)  NSString* village;

@end

@implementation Address

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //模型
    Address *address = [[Address alloc] init];
    address.country = @"China";
    address.province = @"Zhejiang";
    address.city = @"Hangzhou";
    address.village = @"Songmen";
    
    //model转Dictionary(将对应的key所有的属性值都全部取出来)
    NSArray *keyArr = @[@"country", @"province", @"city", @"village"];
    NSDictionary *modelDic = [address dictionaryWithValuesForKeys:keyArr];
    NSLog(@"%@", modelDic);
    
    //Dictionary转Model
    NSDictionary *modifyDic = @{@"country":@"Japan",
                                @"province":@"JpanProvince",
                                @"city":@"JpanCity",
                                @"village":@"JpanVillage"
                                };
    [address setValuesForKeysWithDictionary:modifyDic];
    NSLog(@"country:%@，province:%@，city:%@，village:%@",address.country,address.province,address.city,address.village);
}

@end
