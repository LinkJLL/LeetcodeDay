//
//  SwilingMethod.m
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/11.
//

#import "SwilingMethod.h"
#import <objc/runtime.h>

@implementation SwilingMethod
- (void)parentMethod{
    NSLog(@"打印父方法");
}
@end

@implementation SonSwilingMethod
- (void)swilingMehtod{
    [self swilingMehtod];
    NSLog(@"打印子方法");
}

@end
@implementation SonSwilingMethod (Mehod)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originIMP = class_getInstanceMethod(self, @selector(parentMethod));
        Method swizzingIMP = class_getInstanceMethod(self, @selector(swilingMehtod));
        method_exchangeImplementations(originIMP, swizzingIMP);
        
    });
    
    
}

@end


@implementation OCParent

+(void)initialize{
    NSLog(@"这是父类%s",__func__);
}

@end
@implementation OCSon

@end
