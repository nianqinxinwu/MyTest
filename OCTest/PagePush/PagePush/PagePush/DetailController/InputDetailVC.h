//
//  InputDetailVC.h
//  PagePush
//
//  Created by 舞极灵瞳 on 2021/3/10.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^getBackBlock)(NSString * str);
@interface InputDetailVC : UIViewController
@property (nonatomic , copy)  NSString* inputStr;
@property (nonatomic , copy)  getBackBlock BackBlock;

@end

NS_ASSUME_NONNULL_END
