//
//  main.m
//  test2
//
//  Created by Assuner on 2017/3/9.
//  Copyright © 2017年 Assuner. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"

#import <Foundation/Foundation.h>
#import "ASClassA.h"
#import "ASClassB.h"
#import "ASClassC.h"

NSArray<NSString *> *getProperties(Class aClass) {
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(aClass, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
    }
    return mArray.copy;
}

NSArray<NSString *> *getIvars(Class aClass) {
    unsigned int count;
    Ivar *ivars = class_copyIvarList(aClass, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *cName = ivar_getName(ivar);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [mArray addObject:name];
    }
    return mArray.copy;
}

NSArray<NSString *> *getMethods(Class aClass) {
    unsigned int count;
    Method *methods = class_copyMethodList(aClass, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *selectorName = NSStringFromSelector(selector);
        [mArray addObject:selectorName];
    }
    return mArray.copy;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ASClassA *objectA = [[ASClassA alloc] init];
        ASClassB *objectB = [[ASClassB alloc] init];
        ASClassC *objectC = [[ASClassC alloc] init];
        NSString *bbb = objectB.classssss;
        //objectB.classssss = @"";
        
        Class classA1 = object_getClass(objectA);
        Class classA1C = [objectA class]; // objectA.class;
        NSLog(@"before objectA: %@", classA1);
        NSArray *propertiesA1 = getProperties(classA1);
        NSArray *ivarsA1 = getIvars(classA1);
        NSArray *methodsA1 = getMethods(classA1);
        IMP setterA1IMP = objectA.imp;
        IMP classA1IMP = objectA.classImp;
        
           Class classB1 = object_getClass(objectB);
           NSLog(@"before objectA: %@", classB1);
           NSArray *propertiesB1 = getProperties(classB1);
           NSArray *ivarsB1 = getIvars(classB1);
           NSArray *methodsB1 = getMethods(classB1);
        
        [objectA addObserver:objectB forKeyPath:@"value" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        [objectA addObserver:objectC forKeyPath:@"value" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
       
        Class classA2 = object_getClass(objectA);
        Class classA2C = [objectA class];
        BOOL isSame = [objectA isEqual:[objectA self]];
        id xxxx = [[classA2 alloc] init];
        NSLog(@"after objectA: %@", classA2);
        NSArray *propertiesA2 = getProperties(classA2);
        NSArray *ivarsA2 = getIvars(classA2);
        NSArray *methodsA2 = getMethods(classA2);
        IMP setterA2IMP = objectA.imp;
        IMP classA2IMP = objectA.classImp;
        
          Class classB2 = object_getClass(objectB);
          NSLog(@"before objectA: %@", classB2);
          NSArray *propertiesB2 = getProperties(classB2);
          NSArray *ivarsB2 = getIvars(classB2);
          NSArray *methodsB2 = getMethods(classB2);
        
             NSObject *object = [[NSObject alloc] init];
             NSArray *propertiesObj = getProperties([object class]);
             NSArray *methodsObj = getMethods([object class]);
             NSArray *ivarsObj = getIvars([object class]);
        
        BOOL isSameClass = [classA1 isEqual:classA2];
        BOOL isSubClass = [classA2 isSubclassOfClass:classA1];
  
        objectA.value = 10;
        [objectA removeObserver:objectB forKeyPath:@"value"];
        [objectA removeObserver:objectC forKeyPath:@"value"];
        
        NSNumber *integerNumber = [NSNumber numberWithInteger:1];
        Class integerNumberClass = object_getClass(integerNumber);
        NSNumber *boolNumber = [NSNumber numberWithBool:YES];
        Class boolNumberClass = object_getClass(boolNumber);
    }
    return 0;
}

#pragma clang diagnostic pop
