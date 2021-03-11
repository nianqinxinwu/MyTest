//
//  CustomButton.m
//  OCTest
//
//  Created by 舞极灵瞳 on 2021/3/9.
//

#import "CustomButton.h"

@implementation CustomButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!self.userInteractionEnabled || [self isHidden] || self.alpha <= 0.01) {
        return nil;
    }
    
    
    if ([self pointInside:point withEvent:event]) {
        __block UIView *hit = nil;
        //倒序遍历
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
               //坐标转换
            CGPoint vonverPoint = [self convertPoint:point toView:obj];
            //调用子视图的hitTest方法
            hit = [obj hitTest:vonverPoint withEvent:event];
            
            //如果找到了接受事件的对象，则停止遍历
            
            if (hit) {
                *stop = YES;
            }
        }];
        
        if (hit) {
            return hit;
        }
        else{
            return self;
        }
    }
    else{
        return nil;
    }
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    
    CGFloat x2 = self.frame.size.width / 2;
    CGFloat y2 = self.frame.size.height / 2;
    
    double dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    
    if (dis <= self.frame.size.width / 2) {
        return YES;
    }else{
        return NO;
    }
}

@end
