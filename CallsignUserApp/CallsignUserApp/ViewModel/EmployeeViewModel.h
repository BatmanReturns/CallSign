//
//  EmployeeViewModel.h
//  CallsignUserApp
//
//  Created by subhajit paul on 24/7/2024.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "EmployeeCell.h"
#import "ImageCache.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^EmployeeImageCompletionBlock)(UIImage* _Nullable response,NSError * _Nullable error);

@interface EmployeeViewModel : NSObject
@property (nonatomic, strong, readonly) NSArray<Employee *> *employees;

- (void)fetchUsersWithCompletion:(void (^)(NSError * _Nullable error))completion;

- (void)loadImageFromURLWithCompletion:(NSString *)urlString completion:(EmployeeImageCompletionBlock)completion;
@end

NS_ASSUME_NONNULL_END
