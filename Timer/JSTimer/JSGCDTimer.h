//
//  JSGCDTimer.h
//  Timer
//
//  Created by FengDing_Ping on 2017/11/3.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSGCDTimer : NSObject

/**
 定时器工厂方法
 
 @param ti 间隔
 @param aTarget 目标
 @param aSelector 执行方法
 @param yesOrNo 是否循环
 @return JSGCDTimer实例
 */

+ (JSGCDTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

/**
 销毁
 */

- (void)invalidate;

@end

NS_ASSUME_NONNULL_END
