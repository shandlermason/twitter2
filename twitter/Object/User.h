//
//  User.h
//  twitter
//
//  Created by samason1 on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

// TODO: Add properties
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSString *pP;

// TODO: Create initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary; 






@end

NS_ASSUME_NONNULL_END
