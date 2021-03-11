//
//  UIButton+CYExpanClickButton.m
//  OCTest
//
//  Created by 舞极灵瞳 on 2021/3/9.
//

#import "UIButton+CYExpanClickButton.h"
#import <objc/runtime.h>

//按钮点击可扩大范围
static char* const expandHitFloatKey  = "expandHitFloatKey";

@implementation UIButton (CYExpanClickButton)

// 重写方法-点击是否在可响应范围内
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.expandHitFloat) {
        CGRect buttonFrame = self.bounds;
        
        CGRect hitFrame = CGRectInset(buttonFrame, self.expandHitFloat, self.expandHitFloat);
        return CGRectContainsPoint(hitFrame, point);
    } else {
        return  [super pointInside:point withEvent:event];
    }
}

#pragma mark - setter & getter

- (CGFloat)expandHitFloat
{
    return [objc_getAssociatedObject(self, expandHitFloatKey) floatValue];
}

- (void)setExpandHitFloat:(CGFloat)expandHitFloat
{
    objc_setAssociatedObject(self, expandHitFloatKey, @(expandHitFloat), OBJC_ASSOCIATION_ASSIGN);
}

@end
