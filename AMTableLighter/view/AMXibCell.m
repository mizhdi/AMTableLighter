//
//  AMXibCell.m
//  AMTableLighter
//
//  Created by Mi Zhengdi on 27/1/2016.
//  Copyright © 2016 AM. All rights reserved.
//

#import "AMXibCell.h"
#import "AMTestVO.h"

@interface AMXibCell()

@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@end

@implementation AMXibCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillValues:(id)obj {
    AMTestVO *vo = (AMTestVO *)obj;
    _descLabel.text = vo.title;
}

@end
