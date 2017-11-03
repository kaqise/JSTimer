//
//  JSGCDTimer.m
//  Timer
//
//  Created by FengDing_Ping on 2017/11/3.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "JSGCDTimer.h"
#import <objc/message.h>

@interface JSGCDTimer ()

/**  GCDTimer */
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation JSGCDTimer

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
+ (JSGCDTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo{
    
    JSGCDTimer *timer = [[self alloc]init];
    SEL originalSelector = aSelector;
    Method originalMethod = class_getInstanceMethod(object_getClass(aTarget) , originalSelector);
    
    IMP originalIMP = class_getMethodImplementation(object_getClass(aTarget), originalSelector);
    SEL swizzledSelector = sel_registerName("timerAction");
    class_addMethod(timer.class, swizzledSelector, originalIMP, method_getTypeEncoding(originalMethod));
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    timer.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer.timer, dispatch_time(DISPATCH_TIME_NOW, 0), ti *NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer.timer, ^{
        [timer performSelector:swizzledSelector withObject:userInfo];
        if (!yesOrNo) {
            
            dispatch_cancel(timer.timer);
            timer.timer = nil;
        }
    });
    dispatch_resume(timer.timer);
    
    return timer;
}

- (void)invalidate{
    dispatch_cancel(self.timer);
    self.timer = nil;
}

@end
