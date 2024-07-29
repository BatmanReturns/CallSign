//
//  Employee.m
//  CallsignUserApp
//
//  Created by subhajit paul on 24/7/2024.
//

#import "Employee.h"

@implementation Employee

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _uuid = dictionary[@"uuid"];
        _fullName = dictionary[@"full_name"];
        _phoneNumber = dictionary[@"phone_number"];
        _emailAddress = dictionary[@"email_address"];
        _biography = dictionary[@"biography"];
        _photoUrlSmall = dictionary[@"photo_url_small"];
        _photoUrlLarge = dictionary[@"photo_url_large"];
        _team = dictionary[@"team"];
        _employeeType = dictionary[@"employee_type"];
    }
    return self;
}

@end
