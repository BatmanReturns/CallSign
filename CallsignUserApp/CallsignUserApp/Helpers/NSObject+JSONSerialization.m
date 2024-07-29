//
//  NSObject+JSONSerialization.m
//  CallsignUserApp
//
//  Created by subhajit paul on 24/7/2024.
//

#import "NSObject+JSONSerialization.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (JSONSerialization)

+ (NSDictionary *)mapping {
    return @{
        @"uuid": @"uuid",
        @"full_name": @"fullName",
        @"phone_number": @"phoneNumber",
        @"email_address": @"emailAddress",
        @"biography": @"biography",
        @"photo_url_small": @"photoUrlSmall",
        @"photo_url_large": @"photoUrlLarge",
        @"team": @"team",
        @"employee_type": @"employeeType"
    };
}

+ (instancetype)withDictionary:(NSDictionary *)dictionary {
    id instance = [[self alloc] init];
    NSDictionary *mapping = [self mapping];

    for (NSString *key in mapping) {
        NSString *property = mapping[key];
        id value = dictionary[key];
        
        if (value != [NSNull null]) {
            [instance setValue:value forKey:property];
        }
    }
    
    return instance;
}

+ (NSArray *)withArray:(NSArray *)array
{
    NSMutableArray *result = [@[] mutableCopy];
    for (NSDictionary *dict in array) {
        id item = [self withDictionary:dict];
        if (item) {
            [result addObject:item];
        }
    }
    return [result copy];
}

@end
