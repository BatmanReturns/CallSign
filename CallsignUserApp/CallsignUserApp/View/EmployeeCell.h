//
//  EmployeeCell.h
//  CallsignUserApp
//
//  Created by subhajit paul on 26/7/2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

NS_ASSUME_NONNULL_END
