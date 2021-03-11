//
//  obj_A.m
//  OCTest
//
//  Created by 舞极灵瞳 on 2021/3/9.
//

#import "Mobj_A.h"

@implementation Mobj_A

/*
+(instancetype)sharedManager{
    static Mobj_A* _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[Mobj_A alloc] init];
        [_instance initManager];
            });
    return _instance;
}

- (void)initManager
{
    
}
*/
+ (instancetype)shareManager{
    static Mobj_A * _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[Mobj_A alloc]init];
        [_instance initManager];
    });
    return _instance;
}

- (void)initManager
{
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = 0;
    }
    return self;
}

- (void)increase
{
    _value += 1;
}

@end
