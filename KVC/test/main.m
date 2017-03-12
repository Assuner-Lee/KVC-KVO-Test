
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "ASClassA.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ASClassA *objectA = [[ASClassA alloc] init];
        
        objectA.stringA = @"stringA setter";                         // setter
        [objectA setValue:@"stringA KVC" forKey:@"stringA"];         // kvc
        [objectA setValue:@"_stringA KVC" forKey:@"_stringA"];       // kvc _
        //[objectA setValue:@"__stringA KVC" forKey:@"__stringA"];   // kvc__
        
        NSLog(@" objectA.stringA 值: %@", objectA.stringA);
        
        NSLog(@"---------------------------------------------------------");
        
        [objectA setValue:@"_modelString kvc" forKeyPath:@"modelA._modelString"];    //setter
        [objectA setValue:@"modelString kvc" forKeyPath:@"modelA.modelString"];      // kvc 不存在的属性
         [objectA setValue:@"__modelString kvc" forKeyPath:@"modelA.__modelString"]; //kvc _
        
       //[objectA setValue:@"noExist1" forKeyPath:@"modelA.noExist1"];              //kvc 不存在的属性
        NSLog(@"objectA.modelA._modelString 值: %@", objectA.modelA._modelString);
        
        NSLog(@"---------------------------------------------------------");
        
        NSString *s1 = [objectA valueForKeyPath:@"modelA._modelString"];
        NSString *s2 = [objectA valueForKeyPath:@"modelA.modelString"];
        NSString *s3 = [objectA valueForKeyPath:@"modelA.__modelString"];
}
    return 0;
}
