//
//  JSTimer.m
//  Timer
//
//  Created by Milton on 17/9/9.
//  Copyright © 2017年 Milton. All rights reserved.
//

#import "JSTimer.h"
#import <objc/message.h>



@interface JSTimer ()
@property (nonatomic, strong)NSTimer *timer;
@end

@implementation JSTimer

+ (JSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo{
    
    JSTimer *timer = [[self alloc]init];
    SEL originalSelector = aSelector;
    Method originalMethod = class_getInstanceMethod(object_getClass(aTarget) , originalSelector);
    IMP originalIMP = class_getMethodImplementation(object_getClass(aTarget), originalSelector);
    SEL swizzledSelector = sel_registerName("timerAction");
    class_addMethod(timer.class, swizzledSelector, originalIMP, method_getTypeEncoding(originalMethod));
    timer.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:timer  selector:swizzledSelector userInfo:userInfo repeats:yesOrNo];
    return timer;
}

- (void)invalidate{
    [self.timer invalidate];
}
- (void)fire{
    [self.timer fire];
}


@end
