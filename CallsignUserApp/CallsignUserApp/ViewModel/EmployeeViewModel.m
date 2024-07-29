//
//  EmployeeViewModel.m
//  CallsignUserApp
//
//  Created by subhajit paul on 24/7/2024.
//

#import "EmployeeViewModel.h"
#import <CallSignNetworking/CSAPIRequest.h>
#import <CallSignNetworking/CSHTTPMethod.h>
#import <CallSignNetworking/CSNetworkManager.h>
#import "EmployeeResponse.h"


@implementation EmployeeViewModel

- (void)fetchUsersWithCompletion:(void (^)(NSError * _Nullable error))completion{
    
    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/sq-mobile-interview/employees.json"];
   // NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"];
    CSAPIRequest *request = [[CSAPIRequest alloc] initWithURL:url httpMethod:HTTPMethodGET parameters:nil headers:nil];
    EmployeeResponse *parser = [[EmployeeResponse alloc]init];
    [[CSNetworkManager sharedManager] dataTaskWithAPIRequest:request responseType:parser completion:^(id  _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Request Failed: %@", error);
            completion(error);
            return;
        }
        self->_employees = response;
        completion(nil);
    }];
}

- (void)loadImageFromURLWithCompletion:(NSString *)urlString completion:(EmployeeImageCompletionBlock)completion {
    NSURL *url = [NSURL URLWithString:urlString];
    CSAPIRequest *request = [[CSAPIRequest alloc] initWithURL:url httpMethod:HTTPMethodGET parameters:nil headers:nil];
    EmployeePhotosResponse *parser = [[EmployeePhotosResponse alloc]init];
    [[CSNetworkManager sharedManager] dataTaskWithAPIRequest:request responseType:parser completion:^(id  _Nullable response, NSError * _Nullable error) {
        completion(response,error);
    }];
}
@end
