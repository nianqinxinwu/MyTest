//
//  ViewController.m
//  PagePush
//
//  Created by 舞极灵瞳 on 2021/3/10.
//

#import "ViewController.h"

#import "Masonry.h"

#import "InputDetailVC.h"

#import "TableViewCell.h"

#define CellID @"TableCell"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , weak) UITableView * tableView;
@property (nonatomic , strong) NSMutableArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self constructUI];
}

- (void)constructUI
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    }
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:CellID];
    
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableView = tableView;
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:CellID];
    }
    
    if (_dataArray.count > indexPath.row) {
        [cell updateTitle:_dataArray[indexPath.row]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_dataArray.count != 0) {
        NSString * pushStr = [_dataArray objectAtIndex:indexPath.row];
        InputDetailVC * inputVC = [[InputDetailVC alloc]init];
        inputVC.inputStr = pushStr;
        __weak __typeof__(self) WeakSelf = self;
        inputVC.BackBlock = ^(NSString * backStr){
            NSLog(@"dataArrayBefore: %@", WeakSelf.dataArray);
            [WeakSelf.dataArray replaceObjectAtIndex:indexPath.row withObject:backStr];
            [WeakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            NSLog(@"dataArrayAfter: %@", WeakSelf.dataArray);
        };
        [self presentViewController:inputVC animated:NO completion:nil];
        
    }
}
    
- (void)setBackInfo:(NSDictionary *)dict
{
    NSInteger  row = [dict[@"row"] longValue];
    
    [_dataArray replaceObjectAtIndex:row withObject:dict[@"str"]];
    
    [self.tableView reloadData];
    
    
}

@end
