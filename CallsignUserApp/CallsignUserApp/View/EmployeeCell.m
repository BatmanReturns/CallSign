//
//  EmployeeCell.m
//  CallsignUserApp
//
//  Created by subhajit paul on 26/7/2024.
//

#import "EmployeeCell.h"

@implementation EmployeeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _photoImageView.layer.cornerRadius = _photoImageView.frame.size.height /2;
    _photoImageView.layer.masksToBounds = YES;
    _photoImageView.layer.borderWidth = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
