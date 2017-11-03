//
//  JSTimer.h
//  Timer
//
//  Created by Milton on 17/9/9.
//  Copyright © 2017年 Milton. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSTimer : NSObject

/**
 定时器工厂方法

 @param ti 间隔
 @param aTarget 目标
 @param aSelector 执行方法
 @param yesOrNo 是否循环
 @return JSTimer实例
 */
+ (JSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;


/**
 销毁
 */
- (void)invalidate;


/**
 执行一次(Timer初始化后要1秒钟后开始运行 调用fire立即执行一次 更加自然)
 */
- (void)fire;

@end

NS_ASSUME_NONNULL_END
