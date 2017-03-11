//
//  ASClassA.h
//  test2
//
//  Created by Assuner on 2017/3/9.
//  Copyright © 2017年 Assuner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface ASClassA : NSObject

@property (nonatomic, assign) NSUInteger value;

@property (nonatomic, assign) IMP imp;

@property (nonatomic, assign) IMP classImp;

@end
