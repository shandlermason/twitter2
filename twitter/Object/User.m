//
//  User.m
//  twitter
//
//  Created by samason1 on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        
        //images from profiles online
        self.pP = dictionary[@"profile_image_url_https"];
        // Initialize any other properties
    }
    return self;
}


@end
