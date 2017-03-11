//
//  ASClassB.m
//  test2
//
//  Created by Assuner on 2017/3/9.
//  Copyright © 2017年 Assuner. All rights reserved.
//

#import "ASClassB.h"

@implementation ASClassB

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"B接收到变化");
}

- (NSString *)classssss {
    return @"classssss";
}

- (void)setClassssss {
    
}

@end
