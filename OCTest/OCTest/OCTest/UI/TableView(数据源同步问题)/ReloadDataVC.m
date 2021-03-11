//
//  ReloadDataVC.m
//  OCTest
//
//  Created by 舞极灵瞳 on 2021/3/9.
//

#import "ReloadDataVC.h"

#define CELL_ID @"cellID"
#define SECONDS_PER_YEAR 60 * 60 * 24 * 365UL
#define WEAKSELF __weak __typeof__(self) weakSelf = self;
@interface ReloadDataVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView * table;
@property (nonatomic , strong) NSMutableArray * dataArr;
@property (nonatomic , strong) NSMutableArray * hasDeleteArr;
@end

@implementation ReloadDataVC

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (NSMutableArray *)hasDeleteArr
{
    if (!_hasDeleteArr) {
        _hasDeleteArr = [NSMutableArray array];
    }
    return _hasDeleteArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    NSLog(@"ONE_YEAR_SECONDS = %ld",SECONDS_PER_YEAR);
    [self conStructUI];
}

- (void)conStructUI
{
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_ID];
    [self.view addSubview:self.table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * itemArr = [self.dataArr objectAtIndex:section];
    return itemArr.count;
}

//刷新数据
- (void)AddingData
{
    WEAKSELF
    NSMutableArray * addArr = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5"]];
    [self.dataArr addObject:addArr];
    dispatch_group_t group = dispatch_group_create();
    // 创建并发队列
        dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_async(group, queue, ^{
        while (weakSelf.hasDeleteArr.count != 0) {
            
            NSIndexPath * indexPath = weakSelf.hasDeleteArr.firstObject;
            NSMutableArray * deletArr = weakSelf.dataArr[indexPath.section];
            
            
        }
    });
    
    
    [self.table reloadData];
}

- (void)getNewData
{
    dispatch_queue_t queue = dispatch_queue_create("NewReload", DISPATCH_QUEUE_CONCURRENT);
    WEAKSELF
    dispatch_after(10, dispatch_get_main_queue(), ^{
        [weakSelf AddingData];
    });
}

@end
