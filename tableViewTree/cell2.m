//
//  cell2.m
//  tableViewTree
//
//  Created by 孙国立 on 2020/8/27.
//  Copyright © 2020 孙国立. All rights reserved.
//

#import "cell2.h"

@implementation cell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.title];
    }
    return self;
    
}


- (UILabel *)title{
    if (_title == nil) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 100, 44)];
    }
    return _title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
