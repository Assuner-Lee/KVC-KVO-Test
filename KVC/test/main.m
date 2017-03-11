
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








































//此方法的默认实现执行以下操作：
//    1.在接收器的类中搜索其名称与模式-get <Key>， - <key>或-is <Key>匹配的访问器方法。如果发现这样的方法，它被调用。如果方法的结果的类型是一个对象指针类型，则返回结果。如果结果的类型是NSNumber支持的标量类型之一，则转换完成并返回NSNumber。否则，转换完成并返回一个NSValue（在Mac OS 10.5中是新的：任意类型的结果被转换为NSValues，而不仅仅是NSPoint，NRange，NSRect和NSSize）。
//    2（Mac OS 10.7中引入）。否则（没有找到简单的访问器方法），在接收者的类中搜索名称与模式-countOf <Key>和-indexIn <Key> OfObject：和-objectIn <Key> AtIndex：（对应于原始方法由NSOrderedSet类定义）以及 - <key> AtIndexes：（对应于 - [NSOrderedSet objectsAtIndexes：]）。如果找到count方法和indexOf方法以及其他两个可能的方法中的至少一个，则返回响应所有NSOrderedSet方法的收集代理对象。发送到收集代理对象的每个NSOrderedSet消息将导致-countOf <Key>，-indexIn <Key> OfObject :, -objectIn <Key> AtIndex :,和 - <key> AtIndexes： -valueForKey的接收者。如果接收者的类也实现一个可选的方法，其名称匹配模式-get <Key>：range：当适当的时候将使用该方法以获得最佳性能。
//    3.否则（没有找到简单的访问器方法或有序集合访问方法集合），在接收器的类中搜索名称与模式-countOf <Key>和-objectIn <Key> AtIndex：（对应于原语NSArray类定义的方法）和（在Mac OS 10.4中引入） - <key> AtIndexes：（对应于 - [NSArray objectsAtIndexes：]）。如果发现count方法和其他两个可能的方法中的至少一个，则返回响应所有NSArray方法的收集代理对象。发送到收集代理对象的每个NSArray消息将导致-countOf <Key>，-objectIn <Key> AtIndex :,和 - <key> AtIndexes：消息被发送到-valueForKey：的原始接收者的某种组合。如果接收者的类也实现一个可选的方法，其名称匹配模式-get <Key>：range：当适当的时候将使用该方法以获得最佳性能。
//    4（在Mac OS 10.4中引入）。否则（没有找到简单的访问器方法或有序集或数组访问方法集合），在接收器的类中搜索三个方法的名称与模式-countOf <Key>，-enumeratorOf <Key>和-memberOf <Key> :(对应于NSSet类定义的基本方法）。如果找到所有三个这样的方法，则返回响应所有NSSet方法的集合代理对象。发送到收集代理对象的每个NSSet消息将导致-countOf <Key>，-enumeratorOf <Key>和-memberOf <Key>的一些组合：将消息发送到-valueForKey：的原始接收方。



//此方法的默认实现执行以下操作：
//1.搜索接收器的类，以寻找名称与模式集<Key>：匹配的存取器方法。如果找到这样的方法，则检查其参数的类型。如果参数类型不是对象指针类型，但值为nil -setNilValueForKey：被调用。 -setNilValueForKey的默认实现：引发一个NSInvalidArgumentException，但是您可以在应用程序中覆盖它。否则，如果方法的参数的类型是一个对象指针类型，该方法将被调用，并将该值作为参数。如果方法的参数的类型是某种其他类型，则在调用该方法之前执行由-valueForKey：执行的NSNumber / NSValue转换的逆。
//2.否则（没有找到访问器方法），如果接收者的类'+ accessInstanceVariablesDirectly属性返回YES，搜索接收者的类为名称匹配模式_ <key>，_is <Key>，<key> ，或者是<Key>。如果找到这样的实例变量并且其类型是对象指针类型，那么在实例变量的旧值首次释放后，将保留该值并在实例变量中设置结果。如果实例变量的类型是某种其他类型，则其值将在与NSNumber或NSValue相同的转换之后设置，如步骤1中所示。
//否则（没有找到访问器方法或实例变量），调用-setValue：forUndefinedKey :. -setValue：forUndefinedKey的默认实现引发一个NSUndefinedKeyException，但是可以在应用程序中覆盖它。
