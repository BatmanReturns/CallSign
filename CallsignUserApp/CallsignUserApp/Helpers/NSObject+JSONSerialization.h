//
//  NSObject+JSONSerialization.h
//  CallsignUserApp
//
//  Created by subhajit paul on 24/7/2024.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONSerialization)

+ (NSDictionary *)mapping;
+ (instancetype)withDictionary:(NSDictionary *)dictionary;
+ (NSArray *)withArray:(NSArray *)array;

@end
