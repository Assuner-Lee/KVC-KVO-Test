//
//  ASClassA.h
//  ASTest
//
//  Created by Assuner on 2017/3/9.
//  Copyright © 2017年 Assuner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASModel : NSObject

@property (nonatomic, strong) NSString *_modelString;

@end

@interface ASClassA : NSObject

@property (nonatomic, strong) NSString *stringA;

@property (nonatomic, strong) ASModel *modelA;

@end
