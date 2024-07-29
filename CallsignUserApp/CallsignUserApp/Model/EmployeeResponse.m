//
//  EmployeeResponse.m
//  CallsignUserApp
//
//  Created by subhajit paul on 25/7/2024.
//

#import "EmployeeResponse.h"

@implementation EmployeeResponse

- (id)processResponseObject:(NSError **)error;
{
    NSError *__error;
    id processedResponseObject = [super processResponseObject:&__error];
    if (__error || ![processedResponseObject isKindOfClass:[NSDictionary class]]) {
        if (error) *error = __error;
        return nil;
    }
    else {
        NSArray *employeeArray = processedResponseObject[@"employees"];
        return [Employee withArray:employeeArray];
    }
}
- (nonnull NSArray *)employees {
    return self.processedResponseObject;
}

@end

@implementation EmployeePhotosResponse

- (id)processResponseObject:(NSError **)error{
    NSError *__error;
    id processedResponseObject = [super processResponseObject:&__error];
    if (__error || ![processedResponseObject isKindOfClass:[NSData class]]) {
        if (error) *error = __error;
        return nil;
    }
    else {
        return [UIImage imageWithData:self.responseObject];
    }
}

- (nonnull UIImage *)employeeImage {
    return self.processedResponseObject;
 }

@end
