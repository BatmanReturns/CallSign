//
//  Employee.h
//  CallsignUserApp
//
//  Created by subhajit paul on 24/7/2024.
//

#import <Foundation/Foundation.h>
#import "NSObject+JSONSerialization.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject

@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic, strong) NSString *biography;
@property (nonatomic, strong) NSString *photoUrlSmall;
@property (nonatomic, strong) NSString *photoUrlLarge;
@property (nonatomic, strong) NSString *team;
@property (nonatomic, strong) NSString *employeeType;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
