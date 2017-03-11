//
//  ASClassA.m
//  ASTest
//
//  Created by Assuner on 2017/3/9.
//  Copyright © 2017年 Assuner. All rights reserved.
//


#import "ASClassA.h"

@implementation ASModel

- (void)set_modelString:(NSString *)_modelString {
    __modelString = _modelString;
    NSLog(@"执行 setter _modelString");
}


- (void)setModelString:(NSString *)modelString {
    NSLog(@"执行 setter modelString");
}

- (void)setNoExist1:(NSString *)noExist {
    NSLog(@"执行 setter noExist1 ");
}

@end


@implementation ASClassA

- (void)setStringA:(NSString *)stringA {
     NSLog(@"执行 setter stringA");
    _stringA = stringA;
}

- (instancetype)init {
    if (self = [super init]) {
        self.modelA = [[ASModel alloc] init];
    }
    return self;
}

@end
