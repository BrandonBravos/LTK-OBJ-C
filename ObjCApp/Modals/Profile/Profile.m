//
//  Profile.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import "Profile.h"

@implementation Profile

- (void)decodeFromDict:(NSDictionary*)dict{
    self.avatarUrl = dict[@"avatar_url"];
    self.profileId = dict[@"id"];
}

@end
