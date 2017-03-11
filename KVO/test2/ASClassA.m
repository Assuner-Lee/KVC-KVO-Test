//
//  ASClassA.m
//  test2
//
//  Created by Assuner on 2017/3/9.
//  Copyright © 2017年 Assuner. All rights reserved.
//

#import "ASClassA.h"

@implementation ASClassA

- (void)setValue:(NSUInteger)value {
    _value = value;
}

- (IMP)imp {
    return [self methodForSelector:@selector(setValue:)];
}

- (IMP)classImp {
    return [self methodForSelector:@selector(class)];
}

@end
