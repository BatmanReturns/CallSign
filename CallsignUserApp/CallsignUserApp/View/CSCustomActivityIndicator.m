//
//  CSCustomActivityIndicator.m
//  CallsignUserApp
//
//  Created by subhajit paul on 27/7/2024.
//

#import "CSCustomActivityIndicator.h"

@interface CSCustomActivityIndicator ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation CSCustomActivityIndicator

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    // Initialize the activity indicator
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.activityIndicator.color = [UIColor blueColor];
    self.activityIndicator.center = self.center;
    [self addSubview:self.activityIndicator];
}

- (void)startAnimating {
    [self.activityIndicator startAnimating];
}

- (void)stopAnimating {
    [self.activityIndicator stopAnimating];
}

- (BOOL)isAnimating {
    return [self.activityIndicator isAnimating];
}

@end

