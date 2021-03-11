//
//  IndexedTableView.m
//  OCTest
//
//  Created by 舞极灵瞳 on 2021/3/9.
//

#import "IndexedTableView.h"
#import "ViewReusePool.h"

@interface IndexedTableView ()
{
    UIView * containerView;
    ViewReusePool *reusePool;
}
@end

@implementation IndexedTableView

- (void)reloadData
{
    [super reloadData];
    
    //懒加载
    if (containerView == nil) {
        containerView = [[UIView alloc]initWithFrame:CGRectZero];
        
        //避免索引条随着table滚动
        [self.superview insertSubview:containerView aboveSubview:self];
    }
    
    if (reusePool == nil) {
        reusePool = [[ViewReusePool alloc]init];
        
    }
    
    // 标记所有视图为可重用状态
    [reusePool reset];
    
    // reload字母索引条
    [self reloadIndexedBar];
    
}

- (void) reloadIndexedBar
{
    // 获取字母索引条的显示内容
    NSArray<NSString *> *arrayTitles = nil;
    if ([self.indexedDataSource respondsToSelector:@selector(indexTitlesForIndexTableView:)]) {
        arrayTitles = [self.indexedDataSource indexTitlesForIndexTableView:self];
    }
    // 判断字母索引条是否为空
    if (!arrayTitles || arrayTitles.count <= 0) {
        [containerView setHidden:YES];
        return;
    }
    
    NSUInteger count = arrayTitles.count;
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = self.frame.size.height / count;
    
    for (int i = 0; i < [arrayTitles count]; i ++) {
        NSString * title = arrayTitles[i];
        
        UIButton * button = (UIButton *)[reusePool dequeueReuseableView];
        //如果没有可重用的Button重新创建一个
        if (button == nil) {
            button = [[UIButton alloc]initWithFrame:CGRectZero];
            button.backgroundColor = [UIColor whiteColor];
            //注册Button到重用池
            [reusePool addUsingView:button];
            NSLog(@"新创建一个Button");
        }else{
            NSLog(@"Button 重用了");
        }
        
        //添加Button到父视图
        [containerView addSubview:button];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, i * buttonHeight, buttonWidth, buttonHeight)];
    }
    
    [containerView setHidden:NO];
    containerView.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - buttonWidth, self.frame.origin.y , buttonWidth, self.frame.size.height);
}

@end
