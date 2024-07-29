//
//  ImageCache.h
//  CallsignUserApp
//
//  Created by subhajit paul on 26/7/2024.
//

#import <UIKit/UIKit.h>

@interface ImageCache : NSObject

@property (nonatomic, strong) NSCache *cache;

+ (instancetype)sharedCache;
- (UIImage *)imageForKey:(NSString *)key;
- (void)setImage:(UIImage *)image forKey:(NSString *)key;

@end



