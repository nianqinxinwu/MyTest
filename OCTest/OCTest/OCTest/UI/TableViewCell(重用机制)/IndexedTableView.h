//
//  IndexedTableView.h
//  OCTest
//
//  Created by 舞极灵瞳 on 2021/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IndexedTableViewDataSource <NSObject>

// 获取一个tableview的字母索引条数据的方法
- (NSArray <NSString *> *)indexTitlesForIndexTableView:(UITableView *)tableViw;

@end

@interface IndexedTableView : UITableView

@property (nonatomic , weak) id<IndexedTableViewDataSource> indexedDataSource;
@end

NS_ASSUME_NONNULL_END
