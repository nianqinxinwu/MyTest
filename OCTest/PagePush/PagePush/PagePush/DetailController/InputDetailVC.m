

#import "InputDetailVC.h"
#import "Masonry.h"
@interface InputDetailVC ()
@property (nonatomic , weak) UITextField * inputField;
@property (nonatomic , weak) UIButton * submitButton;
@end

@implementation InputDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self constructUI];
}

- (void)constructUI {
    
    UITextField * textField = [[UITextField alloc]init];
    if (![self.inputStr isEqualToString:@""]) {
        textField.text = self.inputStr;
    }
    textField.backgroundColor = [UIColor blueColor];
    textField.textColor = [UIColor whiteColor];
    textField.placeholder = @"请输入修改值";
    [self.view addSubview:textField];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(74);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(30);
    }];
    
    self.inputField = textField;
    
    UIButton * submitBtn = [[UIButton alloc]init];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [submitBtn setTitle:@"保存" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(subClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    self.submitButton = submitBtn;
    
    [submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(30);
    }];
}

- (void)subClick
{
    self.BackBlock(self.inputField.text);
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
