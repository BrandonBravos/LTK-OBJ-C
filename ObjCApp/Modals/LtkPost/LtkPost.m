//
//  LtkPost.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import "LtkPost.h"

@implementation LtkPost
- (void)decodeFromDict:(NSDictionary*)dict{
    self.heroImageUrl = dict[@"hero_image"];
    self.productIds = dict[@"product_ids"];
    self.profileId = dict[@"profile_id"];

    
}

@end
