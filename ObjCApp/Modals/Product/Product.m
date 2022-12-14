//
//  Product.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import "Product.h"

@implementation Product
- (void)decodeFromDict:(NSDictionary*)dict{
    self.productId = dict[@"id"];
    self.imageURL = dict[@"image_url"];
    self.hyperlink = dict[@"hyperlink"];

}

@end
