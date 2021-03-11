//
//  ViewController.m
//  OCTest
//
//  Created by 舞极灵瞳 on 2021/3/8.
//

#import "ViewController.h"
#import "CustomButton.h"

//KVO
#import "Mobj_A.h"
#import "Observer_B.h"

@interface ViewController ()<UICollectionViewDelegateFlowLayout>
{
    CustomButton * cornerButton;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //GCD
//    [self GCDSetting];
    //KVO
//    [self KVOSetting];
    //SubString
//    [self subString];
}
//GCD
- (void)GCDSetting
{
    NSLog(@"1");
    dispatch_queue_t queue = dispatch_queue_create("Test", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"2");
        
        dispatch_async(queue, ^{
            dispatch_async(queue, ^{
                NSLog(@"6");
            });
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
    
//    dispatch_queue_t queue = dispatch_queue_create("134", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"1");
//    dispatch_async(queue, ^{
//        NSLog(@"2");
//        dispatch_sync(queue, ^{
//            NSLog(@"8");
//        });
//    });
//    NSLog(@"3");
//    dispatch_sync(queue, ^{
//        NSLog(@"4");
//        dispatch_async(queue, ^{
//            NSLog(@"5");
//        });
//        NSLog(@"6");
//    });
//
//    NSLog(@"7");
    
    //HitTest
}

//KVO
- (void)KVOSetting
{
    Mobj_A * obj = [[Mobj_A alloc]init];
    Observer_B * obser = [[Observer_B alloc]init];
    
    /*
     po object_getClassName(obj)
     "Mobj_A"
     */
    
    [obj addObserver:obser forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    /*
          po object_getClassName(obj)
     "NSKVONotifying_Mobj_A"
     
     iSA混写技术
     - (void)setValue:(id)value
     {
         [self willChangeValueForKey:@"Keypath"];
         
         [super setValue:value];
         
         [self didChangeValueForKey:@"Keypath"];//触发Observer ValueForKey实现
     }
     
     */
    obj.value = 2;
    
}

//SubStringForm
- (void)subString
{
    NSString * string = @"1234Test";
    NSString * str1 = [string substringToIndex:3];//到num前一位
    NSString * str2 = [string substringFromIndex:4];//从num开始
    NSLog(@"str1 = %@ \n str2 = %@",str1,str2);
}



@end
