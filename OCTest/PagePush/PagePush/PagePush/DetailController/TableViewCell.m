//
//  TableViewCell.m
//  PagePush
//
//  Created by 舞极灵瞳 on 2021/3/10.
//

#import "TableViewCell.h"
#import "Masonry.h"

@interface TableViewCell ()
@property (nonatomic , strong) UILabel * titleLB;
@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLB = [[UILabel alloc]init];
        _titleLB.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(15);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}

- (void)updateTitle:(NSString *)title
{
    self.titleLB.text = title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
