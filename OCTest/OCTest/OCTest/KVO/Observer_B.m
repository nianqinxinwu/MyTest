//
//  Observer_B.m
//  OCTest
//
//  Created by 舞极灵瞳 on 2021/3/9.
//

#import "Observer_B.h"
#import "Mobj_A.h"
@implementation Observer_B

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([object isKindOfClass:[object class]] && [keyPath isEqualToString:@"value"]) {
        NSNumber * value = [change valueForKey:NSKeyValueChangeNewKey];
        NSLog(@"value = %@",value);
    }
}

@end
