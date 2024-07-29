//
//  ViewController.m
//  CallsignUserApp
//
//  Created by subhajit paul on 24/7/2024.
//

#import "EmployeeListViewController.h"
#import "EmployeeViewModel.h"
#import "Employee.h"
#import "EmployeeCell.h"
#import "ImageCache.h"
#import "CSCustomActivityIndicator.h"

@interface EmployeeListViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CSCustomActivityIndicator *activityIndicator;
@property (nonatomic, strong) EmployeeViewModel *viewModel;

@end

@implementation EmployeeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self fetchEmployeeDetails];
}

-(void)setUpUI {

    self.viewModel = [[EmployeeViewModel alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.navigationController.navigationBar.prefersLargeTitles = true;
    self.navigationController.navigationBar.topItem.title = @"Employee";
    self.activityIndicator = [[CSCustomActivityIndicator alloc]init];
    self.activityIndicator.center = self.view.center;
    [self.view addSubview:self.activityIndicator];
}

-(void)fetchEmployeeDetails {
    [self.activityIndicator startAnimating];
    [self.viewModel fetchUsersWithCompletion:^(NSError * _Nullable error) {
      
        if (error) {
            NSLog(@"Failed to fetch employees: %@", error);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicator stopAnimating];
        });
        [self.tableView reloadData];
        
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"EmployeeCell";
    EmployeeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
      if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
      }
    
    Employee *employee = self.viewModel.employees[indexPath.row];
    cell.nameLabel.text = employee.fullName;
    cell.teamLabel.text = employee.team;
    UIImage *cachedImage = [[ImageCache sharedCache] imageForKey:employee.photoUrlSmall];
        if (cachedImage) {
            cell.photoImageView.image = cachedImage;
        } else {
            cell.photoImageView.image = nil;
            [_viewModel loadImageFromURLWithCompletion:employee.photoUrlSmall completion:^(id  _Nullable image, NSError * _Nullable error) {
                if (error == nil && image) {
                    if (image) {
                        [[ImageCache sharedCache] setImage:image forKey:employee.photoUrlSmall];
                        cell.photoImageView.image = image;
                    }
                }
            }];
        }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
