//
//  RITDoctor.m
//  10NotificationsTest
//
//  Created by Aleksandr Pronin on 05.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITDoctor.h"
#import "RITGovernment.h"

@implementation RITDoctor

#pragma mark - Initialization
- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:RITGovernmentSalaryDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:RITGovernmentAveragePriceDidChangeNotification
                 object:nil];
    }
    return self;
}

- (void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void) salaryChangedNotification: (NSNotification*) notification {
    
    NSNumber*   value = [notification.userInfo objectForKey:RITGovernmentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue];
    
    if (salary < self.salary) {
        
        NSLog(@"Doctors are NOT happy");
        
    } else {
        
        NSLog(@"Doctors are happy");
    }
    
    self.salary = salary;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
}

@end
