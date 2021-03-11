//
//  ViewReusePool.h
//  OCTest
//
//  Created by 舞极灵瞳 on 2021/3/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewReusePool : NSObject

//从重用池中取出一个可重用的view
- (UIView *)dequeueReuseableView;

//向重用池当中添加一个视图
-(void)addUsingView:(UIView *)view;

//重置方法，将当前使用中的视图移动到可重用队列当中
- (void)reset;

@end

NS_ASSUME_NONNULL_END
