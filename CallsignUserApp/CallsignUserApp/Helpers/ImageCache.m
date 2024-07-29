//
//  ImageCache.m
//  CallsignUserApp
//
//  Created by subhajit paul on 26/7/2024.
//

#import "ImageCache.h"

@implementation ImageCache

+ (instancetype)sharedCache {
    static ImageCache *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ImageCache alloc] init];
        sharedInstance.cache = [[NSCache alloc] init];
    });
    return sharedInstance;
}

- (UIImage *)imageForKey:(NSString *)key {
    return [self.cache objectForKey:key];
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    if (image) {
        [self.cache setObject:image forKey:key];
    }
}

@end
