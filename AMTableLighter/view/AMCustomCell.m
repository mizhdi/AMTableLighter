//
//  AMCustomCell.m
//  AMTableLighter
//
//  Created by Mi Zhengdi on 27/1/2016.
//  Copyright © 2016 AM. All rights reserved.
//

#import "AMCustomCell.h"
#import "AMTestVO.h"

@interface AMCustomCell() {
    UILabel *_textLabel;
}
@end

@implementation AMCustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubview];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _textLabel.frame = CGRectMake(129, 0, CGRectGetWidth(self.frame) - 129, CGRectGetHeight(self.frame));
}

- (void)setupSubview {
    _textLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_textLabel];
    self.contentView.backgroundColor = [UIColor grayColor];
}

- (void)fillValues:(id)obj {
    AMTestVO *vo = (AMTestVO *)obj;
    _textLabel.text = vo.title;
}

@end
