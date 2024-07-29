//
//  EmployeeResponse.h
//  CallsignUserApp
//
//  Created by subhajit paul on 25/7/2024.
//

#import <UIKit/UIKit.h>

#import <CallSignNetworking/CSAPIResponse.h>
#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmployeeResponse : JSONAPIResponse
-(NSArray *)employees;
@end

@interface EmployeePhotosResponse : SimpleAPIResponse
-(UIImage *)employeeImage;
@end
NS_ASSUME_NONNULL_END
